class Api::V1::ScheduleController < ApplicationController

  # GET /schedules
  def index
    render json: { schedule: [
      { id: 1, title: "explain to you how all this", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco", time: "2016-09-29T02:48:43+00:00", location: "Bog's Apartment", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 2, title: "At vero eos et accusamus et iusto odio", description:"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system", time: "2016-09-29T02:48:43+00:00", location: "Bog's Apartment", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 3, title: "quo minus id", description:"At vero eos et accusamus et iusto odio", time: "2016-09-29T02:48:43+00:00", location: "Bog's Apartment", updatedAt: "2016-08-29T02:48:43+00:00"}
    ] }, status: 200
  end

end
