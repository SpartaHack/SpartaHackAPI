class Api::V1::UsersController < ApplicationController
  before_action :geo_ip
  before_action :restrict_access, only: [:show, :create]
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json

  def show
    if User.exists? id: params[:id]
      render json: User.find(params[:id]), status: 200
    else
      render json: { errors: { user: ["does not exist"] } }, status: 422
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation,
    :first_name, :last_name, roles: []).merge(:roles => ['hacker'])
  end
end
