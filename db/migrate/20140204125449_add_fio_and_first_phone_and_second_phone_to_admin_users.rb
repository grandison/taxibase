# -*- encoding : utf-8 -*-
class AddFioAndFirstPhoneAndSecondPhoneToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :fio, :string
    add_column :admin_users, :first_phone, :string
    add_column :admin_users, :second_phone, :string
  end
end
