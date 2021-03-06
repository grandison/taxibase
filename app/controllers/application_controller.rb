# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :record_user_activity

  def record_user_activity
    if current_user
      current_user.touch :last_active_at
    end
  end

  def set_locale
    I18n.locale = :ru
  end

  def access_denied(exception)
    if current_user.can? :read, Taxist
      redirect_to taxists_path, :alert => exception.message
    else
      if current_user.can? :read, NotCheckedTaxist
        redirect_to not_checked_taxists_path
      else
        redirect_to dashboard_path, :alert => exception.message
      end
    end
  end

  def current_user
    current_admin_user
  end
end
