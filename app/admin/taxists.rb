ActiveAdmin.register Taxist do
  actions :all, :except => [:new]

  filter :first_name
  filter :last_name
  filter :third_name
  filter :address

  menu :priority => 1

  scope_to :current_admin_user, :association_method => :checked_taxists

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
      row :addons do |taxist|
        render taxist.addons
      end
    end
    render "addons/form"
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
