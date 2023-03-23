# frozen_string_literal: true

class Api::V1::RestaurantmanagementsController < ApplicationController
  before_action :authorize_request
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    #binding.pry
    render json:  Restaurantmanagement.all
  end

  def show
     render json: { message: @restaurant }, status: :ok
  end

  def create
    restaurant = Restaurantmanagement.new(restaurant_params)
    if restaurant.save
      render json: { message: restaurant }, status: :created
    else
      render json: { error: 'Error for creating' }
    end
  end

  def update
      @restaurant.update(restaurant_params)
      render json: { message: @restaurant }, status: :found
  end

  def destroy
      @restaurant.destroy
      render json: { message: 'Restaurant deleted successfully' }, status: :ok
  end

  private

  def set_restaurant
     @restaurant = Restaurantmanagement.find_by(id: params[:id])
     unless @restaurant.present?
      render json: { error: 'Restaurant not found' }, status: :not_found    
     end   

  end

  def restaurant_params
    params.require(:restaurantmanagement).permit(:restaurant_name, :address, :email, :contact_no)
  end
end
