# frozen_string_literal: true

class Api::V1::RestaurantmanagementsController < ApplicationController
  #before_action :authorize_request
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    #binding.pry
    #render json:  Restaurantmanagement.all
    page = params[:page].to_i || 1
    per_page = params[:length].to_i || 10
    offset = (page - 1) * per_page
    order_column_index = params[:order]['0'][:column].to_i
    order_column_direction = params[:order]['0'][:dir]
    search = params[:search][:value].downcase.strip


    sortable_columns = ['restaurant_name', 'address', 'email', 'contact_no']

    if order_column_index >= 0 && order_column_index < sortable_columns.length
      column_name = sortable_columns[order_column_index]
    else
      column_name = 'id'
    end


    if order_column_direction == 'asc'
      order_direction = :asc
    else
      order_direction = :desc
    end
    @count = Restaurantmanagement.all.count
    if search.present?
      @restaurant = Restaurantmanagement.order("#{column_name} #{order_direction}").offset(offset).limit(per_page).where("lower(restaurant_name) LIKE ? OR lower(address) LIKE ?  OR lower(email) LIKE ? ",  "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @restaurant = Restaurantmanagement.order("#{column_name} #{order_direction}").offset(offset).limit(per_page)
    end
    render json: {
      data: @restaurant,
      recordsTotal: @count ,
      recordsFiltered: @count
    }


    

  end

  def show
     render json: { message: @restaurant }, status: :ok
  end

  def create
    restaurant = Restaurantmanagement.new(restaurant_params)
    if restaurant.save
      render json: { message: restaurant }, status: :created
    else
      render json: { error: restaurant.errors }, status: 400
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
    params.permit(:restaurant_name, :address, :email, :contact_no)
  end
end
