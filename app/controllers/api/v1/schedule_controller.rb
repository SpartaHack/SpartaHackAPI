class Api::V1::ScheduleController < ApplicationController
  before_action :geo_ip
  before_action :restrict_access, only: [:show, :index]
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_schedule, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /schedules
  def index
    @schedules = Schedule.all

    render json: { schedule: @schedules }
  end

  # GET /schedules/1
  def show
    render json: @schedule
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      render json: @schedule, status: :created, location: [:api, @schedule]
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule, location: [:api, @schedule]
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def schedule_params
    params.require(:schedule).permit(:title, :description, :time, :location)
  end
end
