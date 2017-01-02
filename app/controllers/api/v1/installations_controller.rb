class Api::V1::InstallationsController < ApplicationController
  before_action :restrict_access, only: [:create]
  before_action :authenticate_with_token!, only: [:index, :show, :update, :destroy]
  before_action :set_installation, only: [:show, :update, :destroy]
  load_and_authorize_resource
  respond_to :json

  # GET /installations
  def index
    @installations = Installation.all

    render json: @installations
  end

  # GET /installations/1
  def show
    render json: @installation
  end

  # POST /installations
  def create
    p Installation.exists?(:token => installation_params[:token])
    if Installation.exists?(:token => installation_params[:token])
      render json: { errors: { token: ["already registered"] } }, status: :unprocessable_entity and return
    end

    @installation = Installation.new(installation_params)

    if @installation.save
      render json: @installation, status: :created, location: [:api, @installation]
    else
      render json: @installation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /installations/1
  def update
    if @installation.update(installation_params)
      render json: @installation, location: [:api, @installation]
    else
      render json: @installation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /installations/1
  def destroy
    @installation.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_installation
    @installation = Installation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def installation_params
    if current_user.present?
      params.require(:installation).permit(:device_type, :token).merge(:user_id => current_user.id)
    else
      params.require(:installation).permit(:device_type, :token)
    end
  end
end
