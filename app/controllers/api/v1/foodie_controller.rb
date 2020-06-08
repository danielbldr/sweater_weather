class Api::V1::FoodieController < ApplicationController
  def index
    foodie = Foodie.new(foodie_params)
    render json: FoodieSerializer.new(foodie).serializable_hash
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
