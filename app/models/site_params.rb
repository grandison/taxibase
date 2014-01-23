# -*- encoding : utf-8 -*-
class SiteParams < ActiveRecord::Base
  attr_accessible :key, :value

  def self.disable_site!
    s = find_or_create_by_key(:site_disabled)
    s.value = "1"
    s.save
  end

  def self.enable_site!
    s = find_or_create_by_key(:site_disabled)
    s.value = "0"
    s.save
  end

  def self.site_enabled?
    find_by_key(:site_disabled).try(:value) != "1"
  end
end
