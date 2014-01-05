class Attachment < ActiveRecord::Base
  attr_accessible :addon_id, :file
  mount_uploader :file, FileUploader
  belongs_to :addon
end
