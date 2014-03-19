# -*- encoding : utf-8 -*-
class NotCheckedTaxist < Taxist
  def store_dir
    "taxist"
  end

  def not_checked
    true
  end
end
