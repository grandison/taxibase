module ActiveAdmin::ViewsHelper #camelized file name
  def pretty_taxist_search(search_hash)
    search_hash.to_a.map do |key,value|
      "#{I18n.translate("activerecord.attributes.taxist.#{key.gsub("_contains", "")}")}=#{value}"
    end.join(",")
  end
end 
