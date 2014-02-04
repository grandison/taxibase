# -*- encoding : utf-8 -*-
ActiveAdmin.register NotCheckedTaxist do
  filter :first_name
  filter :last_name
  filter :third_name
  filter :pasport_number
  filter :vodit_ustov_number
  filter :pozivnoy

  scope_to :current_admin_user, :association_method => :not_checked_taxists

  member_action :check, :method => :put do
    taxist = Taxist.find(params[:id])
    taxist.check!
    redirect_to(not_checked_taxists_path, :notice => "Проверен!")
  end

  member_action :create, :method => :post do
    params[:not_checked_taxist] = params[:not_checked_taxist].merge(user_id: current_admin_user.id)
    create! do |format|
      format.html { redirect_to(not_checked_taxists_path, :notice => "Отправлено на модерацию!") }
    end
  end

  action_item :only => [:edit,:show], :if => proc{ current_admin_user.can?(:check, Taxist) } do
    link_to('Пометить как проверенного!', check_not_checked_taxist_path(not_checked_taxist), method: :put)
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
    column :fio do |taxist|
      link_to(taxist.fio, taxist)
    end
    column :pozivnoy
  end

  show do
    attributes_table do
      row :photo do |taxist|
        if taxist.photo.present?
          image_tag(taxist.photo, style: "max-width:100px;")
        end
      end
      row :first_name
      row :last_name
      row :third_name
      row :address
      row :pasport_number
      row :pasport_info
      row :pasport_scans do |taxist|
        taxist.pasport_scans.map do |ps|
          if ps.file.present?
            image_tag(ps.file, style: "max-width:100px;")
          end
        end.join("<br>").html_safe
      end
      row :vodit_ustov_number
      row :vodit_ustov_date
      row :vodit_ustov_file do |taxist|
        if taxist.vodit_ustov_file.present?
          image_tag(taxist.vodit_ustov_file, style: "max-width:100px;")
        end
      end
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
      row :anketa do |taxist|
        if taxist.anketa.present?
          image_tag(taxist.anketa, style: "max-width:100px;")
        end
      end
      row :pozivnoy
      row :fssp_info
      row :accidents do |taxist|
        render taxist.accidents
      end
      row :reputations do |taxist|
        render taxist.reputations
      end
    end
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
      f.has_many :accidents do |ac|
        ac.input :info
        ac.has_many :attachments do |at|
          at.input :file
        end
      end
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
