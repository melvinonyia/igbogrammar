
##
#
# Decks Controller
#
##

class Api::DecksController < ApplicationController

  before_action :require_user!

  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  # Deck index
  def index # GET /deck
    @decks = Deck.all
    render :index
  end

  # Show individual deck
  def show
    @deck = Deck.find(params[:id])
    render :show
  end

  #
  def new
    @course = Course.find(params[:course_id])
    @deck = Deck.new(course_id: params[:course_id])
    render :new
  end

  # Create deck
  def create # POST /deck
    @deck = Deck.new(deck_params)

    if @deck.save
      #redirect_to deck_url(@deck)
      render :show
    else
      flash.now[:errors] = @deck.errors.full_messages
      render :new
    end
  end

  def edit
    @deck = Deck.find(params[:id])
    render :edit
  end

  # Edit deck
  def update # PATCH /deck?id=1
    @deck = Deck.find(params[:id])

    if @deck.update(deck_params)
      #redirect_to deck_url(@deck)
      render json: ["Patched deck"], status: 200
    else
      flash.now[:errors] = @deck.errors.full_messages
      render :edit
    end
  end

  # Delete deck
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    #redirect_to deck_url
    render json: ["Deck is gone"], status: 200
  end

  private

  def deck_params
    params.require(:deck).permit(:course_id, :name, :objective)
  end

end
