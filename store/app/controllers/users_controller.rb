class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  #before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
   # @user = User.new
  end

  # GET /users/1/edit
  def edit
      authorize! :edit, @item

  end

  # POST /users
  def create
    #@user = User.new(user_params)

    if @user.save
     redirect_to @user, notice: "User was successfully created."
    else
     render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

     successfully_updated = if needs_password?(@user, user_params)
                               @user.update(user_params)
                            else
                               @user.update_without_password(user_params)
                            end

    if successfully_updated
     redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
     # @user = User.find(params[:id])
    #end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :role_id)
    end
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation,:name,:role_id)
    end
    def needs_password?(_user, params)
      params[:password].present?
    end
end
