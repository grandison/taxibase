# -*- encoding : utf-8 -*-
class AddStrictPasswordToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :strict_password, :string
  end
end
