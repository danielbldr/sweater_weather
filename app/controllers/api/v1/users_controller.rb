class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    user.save ? success(user) : error(user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def success(user)
    render json: UsersSerializer.new(user).serializable_hash
  end

  def error(user)
    render json: user.errors
  end
end
