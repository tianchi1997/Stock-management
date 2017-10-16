class UsersController < ApplicationController
  load_and_authorize_resource # Authorise actions

  # Add breadcrumb and set variables
  add_breadcrumb "Users", :users_path
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all.order(:name)
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    add_breadcrumb "New", new_user_path
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb "Edit", edit_user_path(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      add_breadcrumb @user.name, user_path(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :permission_level).reject{ |_, v| v.blank? }
    end
end
