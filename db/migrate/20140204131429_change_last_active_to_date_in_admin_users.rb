class ChangeLastActiveToDateInAdminUsers < ActiveRecord::Migration
  def up
    change_column :admin_users, :last_active_at, :datetime
  end

  def down
    change_column :admin_users, :last_active_at, :time
  end
end
