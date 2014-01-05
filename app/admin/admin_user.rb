ActiveAdmin.register AdminUser do     
  index do                            
    column :email
    column :level                  
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email           
      f.input :level, as: :select, include_blank: false, collection: Level.reverse
      f.input :strict_password, as: :string
    end                               
    f.actions                         
  end                                 
end                                   
