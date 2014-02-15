# -*- encoding : utf-8 -*-
class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.integer :taxist_id
      t.text :description

      t.timestamps
    end
  end
end
