# -*- encoding : utf-8 -*-
ActiveAdmin.register SiteParams do
  menu false
  config.clear_action_items!
  config.filters = false

  form do |f|
    f.inputs "" do
      f.input :key, :input_html => { :disabled => true } 
      f.input :value, :input_html => { style: "height: 200px;" } 
    end
    f.actions
  end
end
