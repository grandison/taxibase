# -*- encoding : utf-8 -*-
class AddActiveToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :active, :boolean, default: false
  end
end
