# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = :ru
  end

  def access_denied(exception)
    redirect_to dashboard_path, :alert => exception.message
  end

  def current_user
    current_admin_user
  end
end
