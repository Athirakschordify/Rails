class Api::V1::CartdetailsController < ApplicationController
 def index
    render json:  Cartdetail.all
  end
  def create
    cart = Cartdetail.new(cartdetails_params)
    if cart.save
     render json: { message: cart }, status: :created
    else
      render json: { error: 'Error for creating' }
    end
  end 
  def cartdetails_params
    params.require(:cartdetail).permit(:cart_id)
  end

end
