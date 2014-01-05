class Level < ActiveRecord::Base
  attr_accessible :name, :number
  scope :reverse, order("number DESC")
end
