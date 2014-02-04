class AddViewsCountToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :views_count, :integer, default: -1
  end
end
