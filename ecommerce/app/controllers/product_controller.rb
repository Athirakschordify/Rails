class ProductController < ApplicationController
    def index
      @products = Product.all
    end 
    def show
      @products = Product.find(params[:id])
    end 
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_index_path
        else
            render :edit
        end
    end
    def product_params
        params.permit(:product_name, :quantity, :price)
    end
end
