
##
#
# Users Controller
#
##

class Api::UsersController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => :create

  # Signup/Register user
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
