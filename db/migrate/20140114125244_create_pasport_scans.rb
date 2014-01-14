class CreatePasportScans < ActiveRecord::Migration
  def change
    create_table :pasport_scans do |t|
      t.string :file
      t.integer :taxist_id

      t.timestamps
    end
  end
end
