# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "TrialEnd" do
  menu false

  content title: "Тестовый период закончился" do
    render "trialend"
  end
end
