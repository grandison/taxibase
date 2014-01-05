ActiveAdmin.register NotCheckedTaxist do
  filter :first_name
  filter :last_name
  filter :third_name
  filter :address

  scope_to :current_admin_user, :association_method => :not_checked_taxists

  member_action :check, :method => :put do
    taxist = Taxist.find(params[:id])
    taxist.check!
    redirect_to({:action => :show}, :notice => "Проверен!")
  end

  member_action :create, :method => :post do
    params[:not_checked_taxist] = params[:not_checked_taxist].merge(user_id: current_admin_user.id)
    create! do |format|
      format.html { redirect_to(not_checked_taxists_path, :notice => "Отправлено на модерацию!") }
    end
  end

  action_item :only => [:edit,:show], :if => proc{ current_admin_user.can?(:check, Taxist) } do
    link_to('Пометить как проверенного!', check_taxist_path(not_checked_taxist), method: :put)
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
    f.inputs "Детали" do
      f.input :first_name
      f.input :last_name
      f.input :third_name
      f.input :photo
      f.input :address
    end
    f.actions
  end
end
