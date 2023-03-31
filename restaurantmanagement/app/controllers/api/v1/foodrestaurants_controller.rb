class Api::V1::FoodrestaurantsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]



  def index
    render json:  Foodrestaurant.all
  end
  def create
    food = Foodrestaurant.new(food_params)
    if food.save
     render json: { message: food }, status: :created
    else
      render json: { error: 'Error for creating' }
    end
  end
  def update
      @food.update(food_params)
      render json: { message: @food }, status: :found
  end
  def destroy
      @food.destroy
      render json: { message: 'Food deleted successfully' }, status: :ok
  end 
  def set_food
     @food = Foodrestaurant.find_by(id: params[:id])
     unless @food.present?
      render json: { error: 'Food not found' }, status: :not_found    
  end   

  end
   def food_params
    params.require(:foodrestaurant).permit(:restaurantmanagement_id, :food_id, :price, :quantity)
   end
end
