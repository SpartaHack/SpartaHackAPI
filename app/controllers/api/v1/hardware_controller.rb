class Api::V1::HardwareController < ApplicationController
  before_action :geo_ip
  before_action :restrict_access, only: [:show, :index]
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_hardware, only: [:show, :update, :destroy]
  load_and_authorize_resource


  # GET /hardware
  def index
    @hardware = Hardware.all

    render json: @hardware
  end

  # GET /hardware/1
  def show
    render json: @hardware
  end

  # POST /hardware
  def create
    @hardware = Hardware.new(hardware_params)

    if @hardware.save
      render json: @hardware, status: :created, location: [:api, @hardware]
    else
      render json: @hardware.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hardware/1
  def update
    if @hardware.update(hardware_params)
      render json: @hardware, location: [:api, @hardware]
    else
      render json: @hardware.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hardware/1
  def destroy
    @hardware.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hardware
    @hardware = Hardware.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def hardware_params
    params.require(:hardware).permit(:item, :lender, :quantity)
  end
end
