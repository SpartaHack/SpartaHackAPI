class Api::V1::AnnouncementsController < ApplicationController

  # GET /announcements
  def index
    render json: { announcements: [
      { id: 1, title: "explain to you how all this", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco", pinned: 0, createdAt: "2016-09-29T02:58:43+00:00", updatedAt: "2016-09-29T05:48:43+00:00"},
      { id: 2, title: "At vero eos et accusamus et iusto odio", description:"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system", pinned: 0, createdAt: "2016-09-29T04:48:43+00:00", updatedAt: "2016-09-29T05:58:43+00:00"},
      { id: 3, title: "quo minus id", description:"At vero eos et accusamus et iusto odio", pinned: 1, createdAt: "2016-09-29T06:48:43+00:00", updatedAt: "2016-09-29T06:48:43+00:00"}
    ] }, status: 200
  end

end
