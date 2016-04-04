class DashboardController < ApplicationController
  before_action :logged_in_user
  layout 'dashboard/dashboard'

  def exchange_received
    @exchanges = Exchange.joins(:receiver_book).where('book_tables.user_id' => current_user.id)
  end

  def exchange_sent
    @exchanges = Exchange.joins(:sender_book).where('book_tables.user_id' => current_user.id)
  end

  def preferences

  end

  def update_user_preferences
      case params[:language][:locale]
      when 'pt'
        current_user.update_attribute(:locale,'pt')
      when 'en'
        current_user.update_attribute(:locale,'en')
      else
        current_user.update_attribute(:locale,'pt')
      end

    redirect_to '/dashboard/preferences'
  end

  private
    def logged_in_user
      unless logged_in?
        flash[:danger] = t('controllers.users.flash.needed_login_error')
        redirect_to login_url
      end
    end
end
