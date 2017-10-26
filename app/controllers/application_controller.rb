class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :set_locale
  before_action :require_login, except: [:not_authenticated]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def set_locale
    locale = if current_user
               current_user.locale
             elsif params[:user_locale]
               params[:user_locale]
             elsif session[:locale]
               session[:locale]
             else
               http_accept_language.compatible_language_from(I18n.available_locales)
             end

    if locale && I18n.available_locales.include?(locale.to_sym)
      session[:locale] = I18n.locale = locale
    else
      session[:locale] = I18n.locale = I18n.default_locale
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def not_authenticated
    redirect_to login_path, alert: t(:please_log_in)
  end

  def not_found
    flash[:alert] = t(:not_found)
    redirect_to root_path
  end
end
