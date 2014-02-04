class AddPhonesToTaxistsRelatives < ActiveRecord::Migration
  def change
    rename_column :taxist_relatives, :mobile_phone, :first_phone
    rename_column :taxist_relatives, :home_phone, :second_phone
    rename_column :taxist_relatives, :email, :third_phone
  end
end
