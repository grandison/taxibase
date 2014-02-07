# -*- encoding : utf-8 -*-
ActiveAdmin.register Question do
  menu false
  config.filters = false

  index do                            
    column :name
    column :email
    column :phone                  
    column :text
    default_actions                   
  end      
end
