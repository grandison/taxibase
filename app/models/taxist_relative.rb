# -*- encoding : utf-8 -*-
class TaxistRelative < ActiveRecord::Base
  attr_accessible :email, :first_name, :home_phone, :mobile_phone, :second_name, :taxist_id, :third_name, :work_place, :work_post, :last_name
end
