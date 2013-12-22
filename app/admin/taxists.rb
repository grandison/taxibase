ActiveAdmin.register Taxist do
  filter :first_name
  filter :last_name
  filter :third_name
  filter :address

  index do
    column :photo do |taxist|
      image_tag(taxist.photo, style: "max-width:100px;")
    end
    column :first_name
    column :last_name
    column :third_name
    column :address
  end
end
