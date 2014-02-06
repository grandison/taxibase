# -*- encoding : utf-8 -*-
ActiveAdmin.register Taxist do
  actions :all, :except => [:new]

  filter :first_name
  filter :last_name, :if => ->(user){ current_admin_user.can?(:view, :fio)}
  filter :third_name, :if => ->(user){ current_admin_user.can?(:view, :fio)}
  filter :pasport_number, :if => ->(user){ current_admin_user.can?(:view, :pasport)}
  filter :vodit_ustov_number
  filter :pozivnoy

  menu :priority => 1

  scope_to :current_admin_user, :association_method => :checked_taxists

  controller do 
    def index
      index! do |format|
        if params[:q]
          if @taxists.count > 0
            @taxists.update_all("search_count = search_count + 1")
          else
            q = params[:q].to_hash
            TaxistSearch.create(search: q)
          end
        end
        format.html
      end
    end

    def show
      current_admin_user.reduce_views_count
      show!
    end
  end

  index do
    column :photo do |taxist|
      if taxist.photo.present?
        link_to(taxist.photo.url, class: :fancybox) do
          image_tag(taxist.photo, style: "max-width:100px;")
        end
      end
    end
    column :vodit_ustov_number
    if current_admin_user.can?(:view, :fio)
      column :fio do |taxist|
        link_to(taxist.fio, taxist)
      end
    else
      column :first_name do |taxist|
        link_to(taxist.first_name, taxist)
      end
    end
    column :pozivnoy
  end

  show do
    attributes_table do
      if current_admin_user.can?(:view, :photo)
        row :photo do |taxist|
          if taxist.photo.present?
            image_tag(taxist.photo, style: "max-width:100px;")
          end
        end
      end
      if current_admin_user.can?(:view, :fio)
        row :first_name
        row :last_name
        row :third_name
      else
        row :first_name
      end
      if current_admin_user.can?(:view, :address)
        row :address
      end
      if current_admin_user.can?(:view, :pasport)
        row :pasport_number
        row :pasport_info
        row :pasport_scans do |taxist|
          taxist.pasport_scans.map do |ps|
            if ps.file.present?
              image_tag(ps.file, style: "max-width:100px;")
            end
          end.join("<br>").html_safe
        end
      end
      row :vodit_ustov_number
      row :vodit_ustov_date
      if current_admin_user.can?(:view, :vodit_ustov_file)
        row :vodit_ustov_file do |taxist|
          if taxist.vodit_ustov_file.present?
            image_tag(taxist.vodit_ustov_file, style: "max-width:100px;")
          end
        end
      end
      if current_admin_user.can?(:view, :taxist_relatives)
        row :taxist_relatives do |taxist|
          taxist.taxist_relatives.map do |tr|
            [tr.first_name,
            tr.last_name,
            tr.third_name,
            tr.work_place,
            tr.work_post,
            tr.first_phone,
            tr.second_phone,
            tr.third_phone].join(",")
          end.join("br").html_safe
        end
      end
      if current_admin_user.can?(:view, :anketa)
        row :anketa do |taxist|
          if taxist.anketa.present?
            image_tag(taxist.anketa, style: "max-width:100px;")
          end
        end
      end
      row :pozivnoy
      row :fssp_info
      row :reputations do |taxist|
        render taxist.reputations
      end
      row :addons do |taxist|
        render taxist.addons
      end
    end
    render "addons/form"
  end

  form do |f|
    f.inputs "" do
      f.input :photo, :as => :file, :hint => f.object.photo.present? ? f.template.image_tag(f.object.photo.url, :style => "max-width:200px;") : f.template.content_tag(:span, "нет фото")
      f.input :first_name
      f.input :last_name
      f.input :third_name
      f.input :birthdate, :start_year => 2000, :end_year => 1900
      f.input :address
      f.input :pasport_number
      f.input :pasport_info
      f.has_many :pasport_scans do |ps|
        ps.input :file
      end
      f.input :vodit_ustov_number
      f.input :vodit_ustov_date, :start_year => Date.today.year, :end_year => 1950
      f.input :vodit_ustov_file
      f.has_many :taxist_relatives do |tr|
        tr.input :first_name
        tr.input :last_name
        tr.input :third_name
        tr.input :work_place
        tr.input :work_post
        tr.input :first_phone
        tr.input :second_phone
        tr.input :third_phone
      end
      if current_admin_user.can? :view, :taxist_am
        f.input :am
      end
      f.input :anketa
      f.input :pozivnoy
      f.input :fssp_info
      f.has_many :reputations do |rep|
        rep.input :info
        rep.has_many :attachments do |at|
          at.input :file
        end
      end
    end
    f.actions
  end
end
