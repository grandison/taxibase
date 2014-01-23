# -*- encoding : utf-8 -*-
class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.text :info
      t.integer :taxist_id

      t.timestamps
    end
  end
end
