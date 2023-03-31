class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    render json:  Food.all
  end
  def create
    food = Food.new(food_params)
    if food.save
     render json: { message: food }, status: :created
    else
      render json: { error: 'Error for creating' }
    end
   end 
  def destroy
      @food.destroy
      render json: { message: 'Food deleted successfully' }, status: :ok
  end 
  def set_food
     @food = Food.find_by(id: params[:id])
     unless @food.present?
       render json: { error: 'Food not found' }, status: :not_found    
      end   
  end

   def food_params
    params.require(:food).permit(:food_name, :is_active)
   end
end
