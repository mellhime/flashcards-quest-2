module Dashboard
  class TrainerController < ApplicationController

    def index
      @card = if params[:id]
                current_user.cards.find(params[:id])
              else
                User.choose_card(current_user)
              end

      respond_to do |format|
        format.html
        format.js
      end
    end

    def review_card
      @card = current_user.cards.find(params[:card_id])

      check_result = @card.check_translation(trainer_params[:user_translation])

      if check_result[:state]
        if check_result[:distance].zero?
          flash[:notice] = t(:correct_translation_notice)
        else
          flash[:alert] = t 'translation_from_misprint_alert',
                            user_translation: trainer_params[:user_translation],
                            original_text: @card.original_text,
                            translated_text: @card.translated_text
        end
        redirect_to trainer_path
      else
        flash[:alert] = t(:incorrect_translation_alert)
        redirect_to trainer_path(id: @card.id)
      end
    end

    private

    def trainer_params
      params.permit(:user_translation)
    end
  end
end
