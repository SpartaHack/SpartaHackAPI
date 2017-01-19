class Api::V1::ResourcesController < ApplicationController
  before_action :geo_ip
  before_action :restrict_access, only: [:show, :index]
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_resource, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /resources
  def index
    @resources = Resource.all

    render json: @resources
  end

  # GET /resources/1
  def show
    render json: @resource
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      render json: @resource, status: :created, location: [:api, @resource]
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      render json: @resource, location: [:api, @resource]
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resource
    @resource = Resource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def resource_params
    params.require(:resource).permit(:name, :url, :sponsor_id)
  end
end
