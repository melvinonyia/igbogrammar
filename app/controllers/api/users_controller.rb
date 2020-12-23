class Api::UsersController < ApplicationController

  # def index
  #   render plain: "I'm in the index action!"
  # end

  #
  def new
    @user = User.new
    render :new
  end

  # signup
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

  # profile
  def show
    # GET /users/123
    @user = User.find(params[:id])
    render :show
  end

  private

  #
  def user_params
    #params.require(:user).permit(:email, :password)
    params.permit(:name, :email, :password)
  end

end
