# -*- encoding : utf-8 -*-
ActiveAdmin.register AdminUser do     
  config.filters = false
  index do                            
    column :organization
    column :fio
    column :level                  
    default_actions                   
  end                                 

  show do
    attributes_table do
      row :organization
      row :fio
      row :email
      row :level
      row :strict_password
      row :first_phone
      row :second_phone
      row :views_count do |t|
        if t.views_count == -1
          "&infin;".html_safe
        else
          t.views_count
        end
      end
      row :scan_ogrn do |ad|
        if ad.scan_ogrn.present?
          image_tag(ad.scan_ogrn, style: "max-width:100px;")
        end
      end
      row :created_at
      row :last_active_at
    end
  end

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :organization
      f.input :fio
      f.input :email           
      f.input :level, as: :select, include_blank: false, collection: Level.reverse
      f.input :strict_password, as: :string
      f.input :first_phone
      f.input :second_phone
      f.input :third_phone
      f.input :scan_ogrn
      f.input :views_count, hint: "-1 - неограниченное количество", min: -1
    end                               
    f.actions                         
  end                                 
end                                   
