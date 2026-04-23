class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.username = @user.username&.downcase
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:error] = @user.errors.full_messages.first
      render "sessions/new", status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
