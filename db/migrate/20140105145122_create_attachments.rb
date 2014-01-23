# -*- encoding : utf-8 -*-
class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :addon_id

      t.timestamps
    end
  end
end
