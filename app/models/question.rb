# -*- encoding : utf-8 -*-
class Question < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :text
end
