# -*- encoding : utf-8 -*-
class CreateSiteParams < ActiveRecord::Migration
  def change
    create_table :site_params do |t|
      t.text :key
      t.text :value

      t.timestamps
    end
  end
end
