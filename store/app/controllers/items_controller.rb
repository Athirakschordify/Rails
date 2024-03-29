class ItemsController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource

  #before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
   # @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    #@item = Item.new(item_params)
      @item.user_id = current_user.id


    if @item.save
      redirect_to @item, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_item
     # @item = Item.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :user_id)
    end
end
