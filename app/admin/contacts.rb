# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Contacts" do
  menu label: "Контакты"

  content title: "Контакты" do
    render "public/contacts"
  end
end
