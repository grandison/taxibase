# -*- encoding : utf-8 -*-
class AddFsspInfoToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :fssp_info, :text
  end
end
