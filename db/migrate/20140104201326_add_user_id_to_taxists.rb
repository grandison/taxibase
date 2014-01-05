class AddUserIdToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :user_id, :integer
  end
end
