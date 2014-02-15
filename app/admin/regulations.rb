# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Regulations" do
  menu label: "О Blacklist"

  content title: "О Blacklist" do
    render "public/regulations"
  end
end
