class Api::V1::SponsorsController < ApplicationController
  before_action :restrict_access
  load_and_authorize_resource
  before_action :geo_ip
  before_action :set_sponsor, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /sponsors
  def index
    @sponsors = Sponsor.all

    render json: @sponsors
  end

  # GET /sponsors/1
  def show
    render json: @sponsor
  end

  # POST /sponsors
  def create
    unless params[:_method].blank?
      set_sponsor
      if params[:_method] == "delete"
        return destroy
      else
        return update
      end
    end
    create_data_uri

    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      render json: @sponsor, status: :created, location: [:api, @sponsor]
    else
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sponsors/1
  def update
    create_data_uri

    if @sponsor.update(sponsor_params)
      render json: @sponsor, location: [:api, @sponsor]
    else
      p @sponsor.errors
      render json: @sponsor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sponsors/1
  def destroy
    @sponsor.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sponsor_params
    @sponsor_params ||= params.permit(:name, :url, :logo_svg_light,
    :logo_png_light, :logo_svg_dark, :logo_png_dark, :level)
  end

  def create_data_uri
    [:logo_svg_light, :logo_png_light, :logo_svg_dark, :logo_png_dark].each do | param |
      if sponsor_params[param].present?
        data = Base64.encode64(sponsor_params[param].read).delete("\n")
        if param == :logo_svg_dark || param == :logo_svg_light
          sponsor_params[param] = "data:image/svg+xml;base64,#{data}"
        else
          sponsor_params[param] = "data:image/png;base64,#{data}"
        end
      else
        pp sponsor_params
      end
    end
  end
end
