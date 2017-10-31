module Dashboard
  class ProfileController < ApplicationController

    def edit; end

    def update
      if current_user.update(user_params)
        redirect_to edit_profile_path,
                    notice: t(:update_profile)
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
                                   :locale)
    end
  end
end
