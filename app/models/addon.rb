# -*- encoding : utf-8 -*-
class Addon < ActiveRecord::Base
  attr_accessible :taxist_id, :text, :attachments_attributes

  belongs_to :taxist
  has_many :attachments, as: :attachmentable

  accepts_nested_attributes_for :attachments
end
