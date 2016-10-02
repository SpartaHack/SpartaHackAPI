class Api::V1::CompaniesController < ApplicationController
  require 'base64'

  # GET /companies
  def index
    data = Base64.encode64(File.join(Rails.root, "app/assets/images/preview.png")).gsub("\n", '')
    uri  = "data:image/png;base64,#{data}"
    render json: { companies: [
      { id: 1, name: "SpartaHack", logo_png:uri, level: "Warrior", url: "https://17.spartahack.com"},
      { id: 2, name: "SpartaDog", logo_png:uri, level: "Commander", url: "https://17.spartahack.com"},
      { id: 3, name: "SpartaSlack", logo_png:uri, level: "Trainee", url: "https://17.spartahack.com"}] }, status: 200
  end

end
