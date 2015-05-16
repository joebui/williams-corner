class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale
  def set_locale
    if current_user
      I18n.locale = current_user.language
    else
      I18n.locale = $language
    end
  end
end
