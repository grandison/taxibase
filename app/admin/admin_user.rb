# -*- encoding : utf-8 -*-
ActiveAdmin.register AdminUser do     
  config.filters = false
  index do                            
    column :email
    column :name
    column :level                  
    default_actions                   
  end                                 

  show do
    attributes_table do
      row :name
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
      row :created_at
      row :last_active_at
    end
  end

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :name        
      f.input :fio
      f.input :email           
      f.input :level, as: :select, include_blank: false, collection: Level.reverse
      f.input :strict_password, as: :string
      f.input :first_phone
      f.input :second_phone
      f.input :views_count, hint: "-1 - неограниченное количество", min: -1
    end                               
    f.actions                         
  end                                 
end                                   
