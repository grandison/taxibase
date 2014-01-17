class CreateTaxistSearches < ActiveRecord::Migration
  def change
    create_table :taxist_searches do |t|
      t.text :search

      t.timestamps
    end
  end
end
