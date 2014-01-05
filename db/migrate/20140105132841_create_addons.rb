class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.text :text
      t.integer :taxist_id

      t.timestamps
    end
  end
end
