class DashboardController < ApplicationController
  before_action :logged_in_user
  layout 'dashboard/dashboard'

  def exchange_received
  end

  def exchange_sent
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = t('controllers.users.flash.needed_login_error')
        redirect_to login_url
      end
    end
end
