ActiveAdmin.register_page "Статистика" do
  menu if: ->{current_admin_user.can?(:view, "Statistic")}
  content do
    render "statistic"
  end
end