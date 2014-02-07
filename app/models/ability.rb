# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    if user.level
      can :read, ActiveAdmin::Page, :name => "TrialEnd"
      cannot :read, ActiveAdmin::Page, :name => "Regulations"
      cannot :read, ActiveAdmin::Page, :name => "Contacts"
      can :manage, Attachment
      can :manage, Addon
      can :view, :photo
      can :view, :fio
      can :view, :address
      can :view, :pasport
      can :view, :vodit_ustov_file
      can :view, :taxist_relatives
      can :view, :anketa
      can :manage, NotCheckedTaxist
      if user.level.number == 0 # Администратор
        can :manage, :all
        cannot :read, ActiveAdmin::Page, :name => "Regulations"
        cannot :read, ActiveAdmin::Page, :name => "Contacts"
        can :view, :taxist_am
        can :check, Taxist
      end

      unless SiteParams.site_enabled?
        return
      end

      if user.level.number == 1 # Модератор
        can :check, Taxist
      end

      if user.level.number == 2 # VIP пользователь
        cannot :view, "Statistic"
        can :read, ActiveAdmin::Page, :name => "Regulations"
        can :read, ActiveAdmin::Page, :name => "Contacts"
        can :read, Taxist
        cannot :read, NotCheckedTaxist
        cannot :check, Taxist
      end

      if user.level.number == 3 # Обычный пользователь
        cannot :view, "Statistic"
        can :read, Taxist
        can :read, ActiveAdmin::Page, :name => "Regulations"
        can :read, ActiveAdmin::Page, :name => "Contacts"
        cannot :view, :photo
        cannot :view, :fio
        cannot :view, :address
        cannot :view, :pasport
        cannot :read, NotCheckedTaxist
        cannot :check, Taxist
        cannot :view, :vodit_ustov_file
        cannot :view, :taxist_relatives
        cannot :view, :anketa
      end
    end
  end
end
