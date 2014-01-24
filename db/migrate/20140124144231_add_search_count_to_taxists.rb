class AddSearchCountToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :search_count, :integer, default: 0
  end
end
