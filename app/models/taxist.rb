class Taxist < ActiveRecord::Base
  attr_accessible :address, :first_name, :last_name, :photo, :third_name, :checked, :user_id
  mount_uploader :photo, PhotoUploader
  scope :checked, where("checked = 1")
  scope :not_checked, where("checked = 0")

  validates :first_name, presence: true

  has_many :addons
  accepts_nested_attributes_for :addons

  def check!
  	update_attribute(:checked, true)
  end
end
