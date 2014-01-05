class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    if user.level
      can :manage, Attachment
      can :manage, Addon
      if user.level.number == 0
        can :manage, :all
      else
        can :manage, NotCheckedTaxist
        can :read, Taxist
        cannot :check, Taxist
      end
    end
  end
end
