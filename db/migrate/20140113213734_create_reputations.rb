class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.text :info
      t.integer :taxist_id

      t.timestamps
    end
  end
end
