# -*- encoding : utf-8 -*-
class AddRegistrationFieldsToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :organization, :string
    add_column :admin_users, :third_phone, :string
    add_column :admin_users, :scan_ogrn, :string
  end
end
