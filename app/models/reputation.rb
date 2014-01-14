class Reputation < ActiveRecord::Base
  attr_accessible :info, :taxist_id, :attachments_attributes
  belongs_to :taxist
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments
end
