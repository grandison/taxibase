class Addon < ActiveRecord::Base
  attr_accessible :taxist_id, :text

  belongs_to :taxist
end
