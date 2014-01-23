# -*- encoding : utf-8 -*-
class TaxistSearch < ActiveRecord::Base
  attr_accessible :search

  serialize :search
end
