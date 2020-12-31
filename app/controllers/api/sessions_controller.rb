
##
#
# Sessions Controller
#
##

class Api::SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  # Start session (login)
  def create # POST /session
    # Query Active Record to find user from params passed in.
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    # Log user in, if they exist.
    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ["Invalid username/password combination"], status: 401
    end
  end

  # End session (logout)
  def destroy # DELETE /session
    @user = current_user
    if @user
      logout
      # render "api/users/show"
      render json: ["User logged out"], status: 200
    else
      render json: ["Nobody logged in"], status: 404
    end
  end
end
