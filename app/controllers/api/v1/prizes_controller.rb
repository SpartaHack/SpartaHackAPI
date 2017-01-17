class Api::V1::PrizesController < ApplicationController
  before_action :geo_ip
  before_action :restrict_access, only: [:show, :index]
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_prize, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /prizes
  def index
    @prizes = Prize.all

    render json: @prizes
  end

  # GET /prizes/1
  def show
    render json: @prize
  end

  # POST /prizes
  def create
    @prize = Prize.new(prize_params)

    if @prize.save
      update_priority
      render json: @prize, status: :created, location: [:api, @prize]
    else
      render json: @prize.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prizes/1
  def update
    if @prize.update(prize_params)
      update_priority
      render json: @prize, location: [:api, @prize]
    else
      render json: @prize.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prizes/1
  def destroy
    @prize.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_prize
    @prize = Prize.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def prize_params
    params.require(:prize).permit(:name, :description, :sponsor_id, :priority)
  end

  def update_priority
    Prize.where("priority >= ? AND id != ?", @prize.priority, @prize.id).each {|m|
      m.update_attribute(:priority, m.id + 1)
    }
  end
end
