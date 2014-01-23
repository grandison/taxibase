# -*- encoding : utf-8 -*-
ActiveAdmin.register Addon do  
  menu false

  member_action :create, :method => :post do
    # params[:addon] = params[:addon].merge(user_id: current_admin_user.id)
    create! do |format|
      format.html { redirect_to(@addon.taxist, :notice => "Создано!") }
    end
  end
end
