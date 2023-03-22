class SaleController < ApplicationController
	before_action :authenticate_customer!
   def index
    @sale = Sale.new
    @sale.product_id = params[:product_id]
    @sale.customer_id = current_customer.id
    @sale.quantity = params[:quantity]
  end

  
  def create
    @sale = Sale.new
    @sale.product_id = params[:product_id]
    @sale.customer_id = current_customer.id
    @sale.quantity = 1
    @sale.status = params[:status]
    @sale.save
    if @sale.status == 'completed'
      @product = @sale.product
      # binding.pry
      @product.update(quantity: @product.quantity - @sale.quantity)

      redirect_to product_index_path
      flash[:alert] = "Order completed"


    else
      redirect_to product_index_path
      flash[:alert] = "Order not completed"

    end

   end

  def sale_params
    params.permit(:product_id, :customer_id, :quantity, :status)
  end
 
 

end
