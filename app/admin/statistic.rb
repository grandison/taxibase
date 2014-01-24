# -*- encoding : utf-8 -*-
ActiveAdmin.register_page "Statistic" do
  menu if: ->{current_admin_user.can?(:view, "Statistic")}, label: ->{ I18n.translate("active_admin.page.statistic") }

  content title: "Статистика" do
    render "statistic"
  end
end
