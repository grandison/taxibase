ActiveAdmin.register Taxist do
  actions :all, :except => [:new]

  filter :first_name, :if => ->(user){ current_admin_user.can?(:view, :fio)}
  filter :last_name, :if => ->(user){ current_admin_user.can?(:view, :fio)}
  filter :third_name, :if => ->(user){ current_admin_user.can?(:view, :fio)}
  filter :address, :if => ->(user){ current_admin_user.can?(:view, :address)}
  filter :pasport_number

  menu :priority => 1

  scope_to :current_admin_user, :association_method => :checked_taxists

  index do
    column :photo do |taxist|
      if taxist.photo.present?
        image_tag(taxist.photo, style: "max-width:100px;")
      end
    end

    if current_admin_user.can?(:view, :fio)
      column :first_name
      column :last_name
      column :third_name
    end

    if current_admin_user.can?(:view, :address)
      column :address
    end
    column :pasport_number
    default_actions
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
      end
      if current_admin_user.can?(:view, :address)
        row :address
      end
      row :pasport_number
      row :pasport_info
      row :vodit_ustov_number
      row :vodit_ustov_date
      row :vodit_ustov_file
      row :addons do |taxist|
        render taxist.addons
      end
    end
    render "addons/form"
  end

  form do |f|
    f.inputs "" do
      f.input :first_name
      f.input :last_name
      f.input :third_name
      f.input :photo
      f.input :address
    end
    f.actions
  end
end
