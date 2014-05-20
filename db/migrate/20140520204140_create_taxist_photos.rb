class CreateTaxistPhotos < ActiveRecord::Migration
  def change
    create_table :taxist_photos do |t|
      t.integer :taxist_id
      t.string :file

      t.timestamps
    end

    Taxist.all.each do |taxist|
      photo = taxist.photo
      if photo
        taxist.taxist_photos.create!(file: photo)
      end
    end
  end
end
