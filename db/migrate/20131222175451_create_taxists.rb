class CreateTaxists < ActiveRecord::Migration
  def change
    create_table :taxists do |t|
      t.string :first_name
      t.string :last_name
      t.string :third_name
      t.string :photo
      t.text :address

      t.timestamps
    end
  end
end
