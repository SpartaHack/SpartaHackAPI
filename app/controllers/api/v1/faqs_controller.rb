class Api::V1::FaqsController < ApplicationController
  load_and_authorize_resource
  before_action :geo_ip
  before_action :set_faq, only: [:show, :update, :destroy]

  # GET /faqs
  def index
    @faqs = Faq.all

    render json: @faqs
  end

  # GET /faqs/1
  def show
    render json: @faq
  end

  # POST /faqs
  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      render json: @faq, status: :created, location: [:api, @faq]
    else
      render json: @faq.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /faqs/1
  def update
    if @faq.update(faq_params)
      render json: @faq
    else
      render json: @faq.errors, status: :unprocessable_entity
    end
  end

  # DELETE /faqs/1
  def destroy
    @faq.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faq_params
      params.require(:faq).permit(:question, :answer).merge(:user_id => current_user.id)
    end
end
