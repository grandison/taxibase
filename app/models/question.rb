class Question < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :text
end
