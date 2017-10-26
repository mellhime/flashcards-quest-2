module Dashboard
  class UsersController < ApplicationController
    def destroy
      current_user.destroy
      redirect_to login_path, notice: t(:delete_user)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
