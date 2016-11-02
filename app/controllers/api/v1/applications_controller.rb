class Api::V1::ApplicationsController < ApplicationController
  load_and_authorize_resource
  before_action :geo_ip
  before_action :set_application, only: [:show, :update, :destroy]

  # GET /applications
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /applications/1
  def show
    render json: @application
  end

  # POST /applications
  def create
    @application = Application.new(application_params)

    if @application.save
      render json: @application, status: :created, location: [:api, @application]
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def application_params
    params.require(:application).permit(:birth_day, :birth_month, :birth_year,
      :gender, :education, :university, :other_university, :travel_origin,
      :graduation_season, :graduation_year, {:major => []}, :hackathons,
      :github, :linkedin, :website, :devpost, :other_link, {:race => []},
    :statement, :outside_north_america).merge(:user_id => current_user.id)
  end
end
