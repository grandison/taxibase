# -*- encoding : utf-8 -*-
class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
