# -*- encoding : utf-8 -*-
class AddUserIdToTaxists < ActiveRecord::Migration
  def change
    add_column :taxists, :user_id, :integer
  end
end
