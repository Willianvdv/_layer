class UsersController < ApplicationController
  def create
    user = User.new user_params
    if user.save
      render json: user
    else
      render status: :bad_request, json: {errors: user.errors}
    end
  end

  private
  def user_params
    params.require(:user).permit(:identifier, :attributes)
  end
end
