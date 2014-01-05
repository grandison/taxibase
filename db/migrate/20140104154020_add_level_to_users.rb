class AddLevelToUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :level_id, :integer
  end
end
