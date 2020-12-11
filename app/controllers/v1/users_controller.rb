class V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: users }, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json:user, status: :created
    else
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end  

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: :ok
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :contact, :imgUrl, :email, :bioData, :socials)
  end
end
