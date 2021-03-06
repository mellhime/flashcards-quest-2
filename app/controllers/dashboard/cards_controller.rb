module Dashboard
  class CardsController < ApplicationController
    before_action :set_card, only: [:show, :destroy, :edit, :update]

    def index
      @cards = current_user.cards.all.order('review_date')
    end

    def new
      @card = Card.new
    end

    def show; end

    def edit; end

    def create
      @card = Card.new(card_params.merge(user_id: current_user.id, remote_image_url: card_params[:image_url]))
      if @card.save
        redirect_to cards_path
      else
        render 'new'
      end
    end

    def update
      if @card.update(card_params)
        redirect_to cards_path
      else
        render 'edit'
      end
    end

    def destroy
      @card.destroy
      redirect_to cards_path
    end

    private

    def set_card
      @card = current_user.cards.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date,
                                   :image, :remove_image, :block_id, :image_url)
    end
  end
end
