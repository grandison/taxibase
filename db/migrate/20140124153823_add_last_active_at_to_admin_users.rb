# -*- encoding : utf-8 -*-
class AddLastActiveAtToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :last_active_at, :time
  end
end
