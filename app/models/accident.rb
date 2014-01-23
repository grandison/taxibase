# -*- encoding : utf-8 -*-
class Accident < ActiveRecord::Base
  attr_accessible :info, :attachments_attributes
  belongs_to :taxist

  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments
end
