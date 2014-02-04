class AddAmToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :am, :string
  end
end
