# -*- encoding : utf-8 -*-
class AddBirthdateToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :birthdate, :date
  end
end
