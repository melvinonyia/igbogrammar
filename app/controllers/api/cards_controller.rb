
##
#
# Cards Controller
#
##

class Api::CardsController < ApplicationController

  before_action :require_user!

  skip_before_action :verify_authenticity_token, :only => [:create, :update, :destroy]

  # Card index
  def index # GET /card
    @card = Card.all
    render :index
  end

  # Show individual card
  def show
    @card = Card.find(params[:id])
    render :show
  end

  #
  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new(card_id: params[:card_id])
    render :new
  end

  # Create card
  def create # POST /card
    @card = Card.new(card_params)

    if @card.save
      #redirect_to card_url(@card)
      render :show
    else
      flash.now[:errors] = @card.errors.full_messages
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
    render :edit
  end

  # Edit card
  def update # PATCH /card?id=1
    @card = Card.find(params[:id])

    if @card.update(card_params)
      #redirect_to card_url(@card)
      render json: ["Patched card"], status: 200
    else
      flash.now[:errors] = @card.errors.full_messages
      render :edit
    end
  end

  # Delete card
  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    #redirect_to card_url
    render json: ["Card is gone"], status: 200
  end

  private

  def card_params
    params.require(:card).permit(:deck_id, :question, :answer)
  end

end
