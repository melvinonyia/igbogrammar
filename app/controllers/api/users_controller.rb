class Api::UsersController < ApplicationController

  # Signup user
  def create # POST /users
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  # User perameters
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
