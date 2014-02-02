# -*- encoding : utf-8 -*-

class UsersController < ApplicationController
  include PermittedAttributes
  
  before_filter :load_user, only: [:update]


  def create
    user = User.new user_params
    if user.save
      render json: user
    else
      render status: :bad_request, json: { errors: user.errors }
    end
  end

  def update
    if @user.update user_params
      render json: @user
    else
      render status: :bad_request, json: { errors: @user.errors }
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end
end