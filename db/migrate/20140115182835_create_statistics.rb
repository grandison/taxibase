class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.text :key
      t.text :value

      t.timestamps
    end
  end
end
