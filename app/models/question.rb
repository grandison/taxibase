# -*- encoding : utf-8 -*-
class Question < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :text
  validates :text, presence: true
  validates :email, presence: true, unless: :phone?
  validates :phone, presence: true, unless: :email?
end
