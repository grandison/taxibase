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
      if user.level.number == 0
        can :manage, :all
        can :check, Taxist
      end

      if user.level.number == 1
        can :manage, NotCheckedTaxist
        can :check, Taxist
      end

      if user.level.number == 2
        can :read, Taxist
        can :manage, NotCheckedTaxist
        cannot :check, Taxist
      end

      if user.level.number == 3
        can :read, Taxist
        cannot :read, NotCheckedTaxist
        cannot :check, Taxist
      end
    end
  end
end
