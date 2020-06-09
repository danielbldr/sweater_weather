class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    return error('email') unless user

    authenticated_user = user.authenticate(params[:password])
    authenticated_user ? success(user) : error('password')
  end

  private

  def success(user)
    render json: UsersSerializer.new(user).serializable_hash
  end

  def error(error = 'password')
    if error == 'password'
      render json: { password: ['Invalid password'] }, status: 400
    else
      render json: { email: ['Invalid email address'] }, status: 400
    end
  end
end
