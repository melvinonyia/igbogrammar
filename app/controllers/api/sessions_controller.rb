class Api::SessionsController < ApplicationController

  # login
  def create
    # POST /session
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login(@user)
      render "api/users/show"
    else
      render json: ["Invalid username/password combination"], status: 401
    end
  end

  # logout
  def destroy
    # DELETE /session
    @user = current_user
    if @user
      logout
      render "api/users/show"
    else
      render json: ["Nobody sign in"], status: 404
    end
  end
end
