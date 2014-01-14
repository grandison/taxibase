class Taxist < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :third_name, :address, :vodit_ustov_number, :pozivnoy, :fssp_info, :accidents_attributes, :user_id, :vodit_ustov_date, :vodit_ustov_file, :taxist_relatives_attributes, :reputations_attributes, :pasport_scans_attributes, :birthdate
  mount_uploader :photo, PhotoUploader
  mount_uploader :vodit_ustov_file, PhotoUploader
  mount_uploader :anketa, PhotoUploader
  scope :checked, where("checked = true")
  scope :not_checked, where("checked = false")

  validates :first_name, :last_name, :third_name, :address, presence: true

  has_many :addons
  has_many :taxist_relatives
  has_many :accidents
  has_many :reputations
  has_many :pasport_scans
  accepts_nested_attributes_for :addons, :taxist_relatives, :accidents, :reputations, :pasport_scans

  def check!
  	update_attribute(:checked, true)
  end
end
