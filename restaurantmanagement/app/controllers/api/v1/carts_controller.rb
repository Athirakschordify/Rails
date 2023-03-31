class Api::V1::CartsController < ApplicationController
  before_action :authorize_request
  before_action :set_cart, only: %i[show edit update destroy]


  def index
    render json:  Cart.all
  end
  def create
    user_restaurant_id = Foodrestaurant.find_by_id(cart_params[:foodrestaurant_id]).restaurantmanagement_id
    cart_user = Cart.where(user_id: @current_user.id)
    if cart_user.present?
      @cart = cart_user.first
      if @cart.restaurantmanagement_id == user_restaurant_id
        user_cart_details = @cart&.cartdetails
        if user_cart_details.present?
          user_cart_details.where(foodrestaurant_id: cart_params[:foodrestaurant_id])&.delete_all
          
        else
          #Create Cart Details
          cart_details
          

        end 
      else
        @cart&.cartdetails.delete_all
        @cart.update(restaurantmanagement_id: user_restaurant_id)
        #Create Cart Details
        cart_details
      end
    else
     @cart = Cart.new
     @cart.restaurantmanagement_id = user_restaurant_id
     #@cart.cartdetails_paramsser_id = @current_user.id 
     @cart.user_id = @current_user.id 
     if @cart.save
      #Create Cart Details
      cart_details
     end
    end 
      render json: @current_user.cart

      #render json: @cart 
      #render json: { error: 'Error for creating' }
    #binding.pry


  end
  def destroy
      @cart.destroy
      render json: { message: 'item deleted successfully' }, status: :ok
  end 

  def user_cart
      render json: @current_user.cart



     #render json: { message: @showcart }, status: :ok
  end

  def set_cart
    @cart = Cart.find_by(id: params[:id])
    unless @cart.present?
      render json: { error: 'item not found' }, status: :not_found    
    end   
  end 

  def cart_details
    cart = Cartdetail.new(cartdetails_params)
    cart.cart_id = @cart.id
    cart.save

  end
  
  def cart_params

    params.permit(:user_id, :foodrestaurant_id)
  end
  def cartdetails_params
    params.permit(:foodrestaurant_id, :quantity)
  end
  
end

