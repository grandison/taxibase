# -*- encoding : utf-8 -*-
class CreateTaxistRelatives < ActiveRecord::Migration
  def change
    create_table :taxist_relatives do |t|
      t.string :first_name
      t.string :last_name
      t.string :third_name
      t.text :work_place
      t.string :work_post
      t.string :email
      t.string :mobile_phone
      t.string :home_phone
      t.integer :taxist_id

      t.timestamps
    end
  end
end
