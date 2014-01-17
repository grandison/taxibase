class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    if user.level
      can :manage, Attachment
      can :manage, Addon
      can :view, :photo
      can :view, :fio
      can :view, :address
      can :view, :pasport
      if user.level.number == 0 # Администратоо
        can :manage, :all
        can :check, Taxist
      end

      unless SiteParams.site_enabled?
        return
      end

      if user.level.number == 1 # Модератор
        can :manage, NotCheckedTaxist
        can :check, Taxist
      end

      if user.level.number == 2 # VIP пользователь
        cannot :view, "Statistic"
        can :read, Taxist
        can :manage, NotCheckedTaxist
        cannot :check, Taxist
      end

      if user.level.number == 3 # Обычный пользователь
        cannot :view, "Statistic"
        can :read, Taxist
        cannot :view, :photo
        cannot :view, :fio
        cannot :view, :address
        cannot :view, :pasport
        cannot :read, NotCheckedTaxist
        cannot :check, Taxist
      end
    end
  end
end
