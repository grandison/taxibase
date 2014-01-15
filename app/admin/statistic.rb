ActiveAdmin.register_page I18n.translate("active_admin.page.statistic") do
  menu if: ->{current_admin_user.can?(:view, "Statistic")}
  content do
    render "statistic"
  end
end