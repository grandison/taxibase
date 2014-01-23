# -*- encoding : utf-8 -*-
class AddMainFieldsToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :pasport_info, :text
    add_column :taxists, :vodit_ustov_number, :string
    add_column :taxists, :vodit_ustov_date, :date
    add_column :taxists, :vodit_ustov_file, :string
    add_column :taxists, :anketa, :string
    add_column :taxists, :pozivnoy, :string
  end
end
