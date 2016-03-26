class SessionsController < ApplicationController
  include SessionsHelper

  def new
    render layout: 'auth'
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password]) then
      log_in @user
      redirect_to dashboard_path
    else
      flash.now[:danger] = t('controllers.sessions.flash.failure')
      render 'new',layout:'auth'
    end


  end

  def destroy
    log_out
    redirect_to root_url
  end
end
