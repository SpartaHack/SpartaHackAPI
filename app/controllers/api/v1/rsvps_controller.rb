class Api::V1::RsvpsController < ApplicationController
  require 'pp'
  load_and_authorize_resource
  before_action :geo_ip
  before_action :set_rsvp, only: [:show, :update, :destroy]


  # GET /rsvps
  def index
    @rsvps = Rsvp.all

    render json: @rsvps
  end

  # GET /rsvps/1
  def show
    render json: @rsvp
  end

  # POST /rsvps
  def create
    if Rsvp.where(user_id: current_user.id).first
      render json: { errors: {
        user: ["has already submitted their RSVP."]
      } }, status: :unprocessable_entity, location: [:api, @rsvp]
      return
    end

    errors = validate
    unless errors[:errors][:please].empty?
      render json: errors, status: 422, location: [:api, @rsvp]
      return
    end

    create_data_uri
    @rsvp = Rsvp.new(rsvp_params)

    if @rsvp.save
      render json: @rsvp, status: :created, location: [:api, @rsvp]
    else
      render json: @rsvp.errors, status: :unprocessable_entity, location: [:api, @rsvp]
    end
  end

  # PATCH/PUT /rsvps/1
  def update
    create_data_uri
    if @rsvp.update(rsvp_params)
      render json: @rsvp, location: [:api, @rsvp]
    else
      render json: @rsvp.errors, status: :unprocessable_entity, location: [:api, @rsvp]
    end
  end

  # DELETE /rsvps/1
  def destroy
    @rsvp.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rsvp_params
    @rsvp_params ||= params.require(:rsvp).permit(:attending, {:dietary_restrictions => []}, :other_dietary_restrictions,
    :resume, :shirt_size, :carpool_sharing, :jobs).merge(:user_id => current_user.id)
  end

  def onsite_params
    params.permit(:onsite)
  end

  def create_data_uri
    if rsvp_params[:resume].present?
      data = Base64.encode64(rsvp_params[:resume].read).delete("\n")
      rsvp_params[:resume] = "data:application/pdf;base64,#{data}"
    end
  end

  def validate
    errors = { errors: { please: [] } }
    if rsvp_params[:attending].blank?
      errors[:errors][:please].push "indicate whether or not you are going."
    elsif rsvp_params[:attending].downcase == 'yes'
      if rsvp_params[:dietary_restrictions] == [""]
        errors[:errors][:please].push "fill out the dietary restrictions section."
      elsif rsvp_params[:shirt_size].blank?
        errors[:errors][:please].push "indicate your shirt size."
      elsif rsvp_params[:carpool_sharing].blank?
        errors[:errors][:please].push "indicate your carpool sharing preference."
      elsif rsvp_params[:resume].blank? && onsite_params[:onsite].blank?
        errors[:errors][:please].push "upload a resume as a pdf."
      elsif rsvp_params[:jobs].blank?
        errors[:errors][:please].push " choose your job preference."
      end
    end

    if rsvp_params[:resume].present? && rsvp_params[:resume].content_type != "application/pdf"
      errors[:errors][:please].push "upload a resume as a pdf."
    elsif rsvp_params[:resume].present? && rsvp_params[:resume].size > 5242880
      errors[:errors][:please].push "upload a pdf resume smaller than 5MB."
    end

    errors
  end

  def conditionality
    if rsvp_params[:dietary_restrictions].include? 'None' or rsvp_params[:dietary_restrictions].include? 'none'
      rsvp_params[:dietary_restrictions] = ["", "None"]
      rsvp_params[:other_dietary_restrictions] = nil
    end
  end
end
