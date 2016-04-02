class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale


  private
    def set_locale
      I18n.locale = current_user.locale if current_user && current_user.locale
    end

end
