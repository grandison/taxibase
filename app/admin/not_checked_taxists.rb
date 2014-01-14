ActiveAdmin.register NotCheckedTaxist do
  filter :first_name
  filter :last_name
  filter :third_name
  filter :address

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
        image_tag(taxist.photo, style: "max-width:100px;")
      end
    end
    column :first_name
    column :last_name
    column :third_name
    column :address
    default_actions
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
    end
  end

  form do |f|
    f.inputs "" do
      f.input :photo
      f.input :first_name
      f.input :last_name
      f.input :third_name
      f.input :birthdate
      f.input :address
      f.input :pasport_number
      f.input :pasport_info
      f.has_many :pasport_scans do |ps|
        ps.input :file
      end
      f.input :vodit_ustov_number
      f.input :vodit_ustov_date
      f.input :vodit_ustov_file
      f.has_many :taxist_relatives do |tr|
        tr.input :first_name
        tr.input :last_name
        tr.input :third_name
        tr.input :work_place
        tr.input :work_post
        tr.input :home_phone
        tr.input :mobile_phone
        tr.input :email
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
