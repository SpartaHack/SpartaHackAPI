class Api::V1::BatchesController < ApplicationController
  before_action :geo_ip
  before_action :set_batch, only: [:update]
  before_action :authenticate_with_token!
  respond_to :json

  # GET /batch/
  def show

    if !params[:id].blank?
      @batch = Batch.where("hackers::varchar[]  @> ARRAY['#{params[:id]}']::varchar[]").to_a[0]

      if @batch.blank?
        render json: { errors: { token: ["does not exist"] } }, status: :unprocessable_entity
      else
        render json: [@batch]
      end
    elsif params[:token].blank?
      @batches = Batch.all
      render json: @batches
    else
      @batch = Batch.find_by(token: params[:token])
      if @batch.blank?
        render json: { errors: { token: ["does not exist"] } }, status: :unprocessable_entity
      else
        render json: [@batch]
      end
    end
  end

  # POST /batch
  def create
    @batch = Batch.new()
    @batch.hackers = [current_user.id.to_i]

    if @batch.save
      render json: @batch, status: :created, location: [:api, @batch]
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /batch/
  def update
    if @batch.blank?
      render json: { errors: { token: ["does not exist"] } }, status: :unprocessable_entity
    else
      if @batch.hackers.include? current_user.id.to_s
        render json: { errors: { user: ["already in this batch"] } }, status: :unprocessable_entity
      else
        @batch.hackers.push(current_user.id.to_s)
        if @batch.save
          render json: @batch
        else
          render json: @batch.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /batch/
  def destroy
    @batch = Batch.where("hackers::varchar[]  @> ARRAY['#{current_user.id}']::varchar[]").to_a[0]
    if @batch.hackers.count == 1
      @batch.destroy
    elsif @batch.hackers.count > 1
      @batch.hackers.delete(current_user.id.to_s)
      @batch.save
    end
    head 204
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_batch
    @batch = Batch.find_by(token: batch_params[:token])
  end

  # Only allow a trusted parameter "white list" through.
  def batch_params
    params.require(:batch).permit(:token)
  end
end
