class AddPasportNumberToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :pasport_number, :string
  end
end
