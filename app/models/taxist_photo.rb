class TaxistPhoto < ActiveRecord::Base
  attr_accessible :file, :taxist_id
  mount_uploader :file, PhotoUploader

  scope :with_photo, where("file IS NOT NULL")
end
