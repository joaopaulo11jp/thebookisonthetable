class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render layout:'auth'
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

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
