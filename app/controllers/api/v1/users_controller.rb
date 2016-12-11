class Api::V1::UsersController < ApplicationController
  before_action :geo_ip
  before_action :find_user_by_id, only: [:show]
  before_action :restrict_access, only: [:show, :create]
  before_action :authenticate_with_token!, only: [:index, :update, :destroy]
  load_and_authorize_resource find_by: :id
  respond_to :json

  def index
    @users = User.all

    render json: @users
  end


  def show
    render json: User.find(params[:id]), include: [:application, :rsvp], status: 200
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
    app = Application.find_by(:user_id => current_user.id)
    unless app.blank?
      app.destroy
    end

    rsvp = Rsvp.find_by(:user_id => current_user.id)
    unless rsvp.blank?
      rsvp.destroy
    end
    current_user.destroy
    head 204
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation,
    :first_name, :last_name, roles: []).merge(:roles => current_user.present? ? current_user.roles : ['hacker'] )
  end

  # render before CanCan Exception
  def find_user_by_id
    if !User.exists? id: params[:id]
      render json: { errors: { user: ["does not exist"] } }, status: 422
    end
  end
end
