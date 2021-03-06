class UsersController < ApplicationController
  before_action :logged_in_user, only: :show

  def show
    @user = current_user
    render layout: 'dashboard/dashboard'
  end

  def new
    @user = User.new
    render layout:'auth'
  end

  def edit
    logged_in_user
    @user = current_user
    render layout: 'dashboard/dashboard'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('controllers.users.flash.success')
      redirect_to user_path(@user.id)
    else
      render 'new', layout: 'auth'
    end
  end

  def update
      if current_user.update user_params then
        flash[:success] = t('controllers.users.update.flash.success')
        redirect_to '/dashboard/user/edit'
      else
        redirect_to '/dashboard/user/edit'
      end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = t('controllers.users.flash.needed_login_error')
        redirect_to login_url
      end
    end
end
