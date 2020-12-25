class Api::UsersController < ApplicationController

  # def index
  #   render plain: "I'm in the index action!"
  # end

  # Signup user
  def create
    # POST /users
    # create new user and store user in object
    @user = User.new(user_params)

    if @user.save
      login(@user)
      render "api/users/show"
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  #
  def new
    @user = User.new
    render :new
  end

  # Query user data
  def show
    # GET /users/123
    @user = User.find(params[:id])
    render :show
  end

  private

  # User perameters
  def user_params
    #params.require(:user).permit(:username, :password)
    params.permit(:name, :username, :password)
  end

end
