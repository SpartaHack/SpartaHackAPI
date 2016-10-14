class Api::V1::PrizesController < ApplicationController
  require 'base64'
  
  # GET /prizes
  def index
    data = Base64.encode64(File.join(Rails.root, "app/assets/images/preview.png")).gsub("\n", '')
    uri  = "data:image/png;base64,#{data}"
    render json: { prizes: [
      { id: 1, name: "explain to you how all this", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco", sponsor: { id: 3, name: "SpartaSlack", logo_png:uri, level: "Warrior", url: "https://17.spartahack.com"}},
      { id: 2, name: "At vero eos et accusamus et iusto odio", description:"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system", sponsor: { id: 3, name: "SpartaSlack", logo_png:uri, level: "Trainee", url: "https://17.spartahack.com"}},
      { id: 3, name: "quo minus id", description:"At vero eos et accusamus et iusto odio", sponsor: { id: 2, name: "SpartaHack", logo_png:uri, level: "Warrior", url: "https://17.spartahack.com"}}
    ] }, status: 200
  end

end
