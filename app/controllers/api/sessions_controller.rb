class Api::SessionsController < ApplicationController

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
  def destroy  # DELETE /session
    @user = current_user
    if @user
      logout
      render "api/users/show"
    else
      render json: ["Nobody sign in"], status: 404
    end
  end

end
