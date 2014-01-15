class PasportScan < ActiveRecord::Base
  attr_accessible :file, :taxist_id
  mount_uploader :file, PhotoUploader
end
