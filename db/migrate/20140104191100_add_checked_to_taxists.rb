class AddCheckedToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :checked, :boolean, default: false
  end
end
