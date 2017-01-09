class Api::V1::AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :update, :destroy]
  before_action :restrict_access, only: [:show, :index]
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  load_and_authorize_resource

  # GET /announcements
  def index
    @announcements = Announcement.all

    render json: @announcements
  end

  # GET /announcements/1
  def show
    render json: @announcement
  end

  # POST /announcements
  def create
    if ios_push && android_push
      Rails.logger.debug Rpush.push
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        render json: @announcement, status: :created, location: [:api, @announcement] and return
      else
        render json: @announcement.errors, status: :unprocessable_entity and return
      end
    else
      render json: { errors: { missing: ["iOS .pem or Android auth key"] } }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /announcements/1
  def update
    if @announcement.update(announcement_params)
      render json: @announcement, location: [:api, @announcement]
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /announcements/1
  def destroy
    @announcement.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def announcement_params
    params.require(:announcement).permit(:title, :description, :pinned)
  end

  def ios_push
    if check_ios_cert
      ios_devices = Installation.where(:device_type => "iOS")

      ios_devices.each do |device|
        n = Rpush::Apns::Notification.new
        n.app = Rpush::Apns::App.find_by_name(ENV['IOS_PUSH_CERT_NAME'])
        n.device_token = device.token # 64-character hex string
        n.alert = announcement_params[:description]
        n.data = {
          alert: announcement_params[:description],
          badge: "Increment",
          sound: "default",
          title: announcement_params[:title],
          description: announcement_params[:description],
          pinned: announcement_params[:pinned]
        }
        n.save!
      end
    else
      return false
    end

    true
  end

  def android_push
    if check_android_cert
      android_devices = Installation.where(:device_type => "android")

      registration_ids = []
      android_devices.each do |device|
        registration_ids.push device.token
      end
      if registration_ids.any?
        n = Rpush::Gcm::Notification.new
        n.app = Rpush::Gcm::App.find_by_name(ENV['ANDROID_PUSH_CERT_NAME'])
        n.registration_ids = registration_ids
        n.data = { message: announcement_params[:description],
          title: announcement_params[:title],
          description: announcement_params[:description],
          pinned: announcement_params[:pinned]
        }
        n.priority = 'high'        # Optional, can be either 'normal' or 'high'
        n.content_available = true # Optional
        # Optional notification payload. See the reference below for more keys you can use!
        n.notification = { body: announcement_params[:description],
          title: announcement_params[:title]
        }
        n.save!
      else
        return false
      end
    else
      return false
    end

    true
  end

  def check_android_cert
    if ENV['ANDROID_PUSH_CERT_NAME'].present? &&
      Rpush::Gcm::App.find_by_name(ENV['ANDROID_PUSH_CERT_NAME']).nil? &&
      ENV['ANDROID_PUSH_TOKEN'].present?

      app = Rpush::Gcm::App.new
      app.name = ENV['ANDROID_PUSH_CERT_NAME']
      app.auth_key = ENV['ANDROID_PUSH_TOKEN']
      app.connections = 1
      app.save!
    end
    true
  end

  def check_ios_cert
    if Rpush::Apns::App.find_by_name(ENV['IOS_PUSH_CERT_NAME']).nil?
      unless File.exist?(ENV['IOS_PUSH_CERT_LOCATION'])
        return false
      end
      app = Rpush::Apns::App.new
      app.name = ENV['IOS_PUSH_CERT_NAME']
      app.certificate = File.read(ENV['IOS_PUSH_CERT_LOCATION'])
      app.environment = ENV['IOS_PUSH_CERT_ENV'] # APNs environment.
      app.password = ENV['IOS_PUSH_CERT_PASSWORD']
      app.connections = 1
      app.save!
    end
    true
  end

end
