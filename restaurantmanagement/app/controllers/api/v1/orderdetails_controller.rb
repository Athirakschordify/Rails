class Api::V1::OrderdetailsController < ApplicationController
 def index
    render json:  OrderDetail.all
 end
end
