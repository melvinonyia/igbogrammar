
##
#
# Course Controller
#
##

class Api::CoursesController < ApplicationController

  before_action :require_user!

  skip_before_action :verify_authenticity_token, :only => [:create, :destroy]

  # Course index
  def index # GET /courses
    @course = Course.all
    render :index
  end

  # Show individual course
  def show
    @course = Course.find(params[:id])
    render :show
  end

  #
  def new
    @course = Course.new
    render :new
  end

  # Create course
  def create # POST /courses
    @course = Course.new(course_params)

    if @course.save
      #redirect_to course_url(@course)
      render :show
    else
      flash.now[:errors] = @course.errors.full_messages
      render :new
    end
  end

  #
  def edit
    @course = Course.find(params[:id])
    render :edit
  end

  #
  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_url(@course)
    else
      flash.now[:errors] = @course.errors.full_messages
      render :edit
    end
  end

  # Delete course
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    #redirect_to course_url
    render json: ["Gone"], status: 200
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

end
