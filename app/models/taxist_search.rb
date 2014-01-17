class TaxistSearch < ActiveRecord::Base
  attr_accessible :search

  serialize :search
end
