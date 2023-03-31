class Api::V1::OrdersController < ApplicationController
before_action :authorize_request

 def index
    render json:  Order.all
 end
 def create
 	cart_user = Cart.find_by(user_id: @current_user.id)
   #binding.pry
   if cart_user.present?
      user_cart_details = cart_user&.cartdetails
      if user_cart_details.present?
         @order = Order.new
         @order.user_id = @current_user.id
         if @order.save
            user_cart_details.each do |cart|
             quantity = cart.quantity
             foodrestaurant_id = cart.foodrestaurant_id
             price = Foodrestaurant.find_by_id(foodrestaurant_id).price

             #Create Order Details
             @orderdetail = OrderDetail.new 
             @orderdetail.order_id = @order.id 
             @orderdetail.foodrestaurant_id = foodrestaurant_id
             @orderdetail.quantity = quantity
             @orderdetail.price = price
             @orderdetail.save

            
             order_total = (quantity * price)
             @order.save
             @order.update(order_total: order_total)
             #binding.pry
             cart.delete



                  
            end
            cart_user.delete
           render json:{ message: "ordered successfully"}

         else
            render json:{ message: "order cannot be saved"}
         end
      else 
         render json:{ message: "no cart details found"}
      end 
   else 
      render json:{ message: "no cart found"}
   end 
   #cart_user.delete_all      
  end 
end   