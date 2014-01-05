class Addon < ActiveRecord::Base
  attr_accessible :taxist_id, :text, :attachments_attributes

  belongs_to :taxist
  has_many :attachments

  accepts_nested_attributes_for :attachments
end
