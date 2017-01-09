class Api::V1::ScheduleController < ApplicationController

  # GET /schedules
  def index
    render json: {[
      { id: 1, title: "Sponsor Registration", description:"", time: "2017-01-20T18:00:00-05:00", location: "Bus Loop Stairwell", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 2, title: "Hacker Registration", description:"Check in using the mobile app by showing your QR Code!", time: "2017-01-20T18:00:00-05:00", location: "B Hall / Main Stairwell", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 3, title: "Dinner", description:"", time: "2017-01-20T19:00:00-05:00", location: "B Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 4, title: "Opening Ceremony", description:"", time: "2017-01-20T21:00:00-05:00", location: "B115", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 5, title: "Team Building", description:"", time: "2017-01-20T22:30:00-05:00", location: "B115", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 6, title: "Hacking Begins", description:"Let SpartaHack17 Begin!", time: "2017-01-21T00:00:00-05:00", location: "", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 7, title: "Midnight Snack", description:"", time: "2017-01-21T00:30:00-05:00", location: "B Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 8, title: "Nap Rooms", description:"Inflatable mattresses and blankets provided!", time: "2017-01-21T01:00:00-05:00", location: "3rd Floor A Wing", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 9, title: "Breakfast", description:"The most important meal of the day.", time: "2017-01-21T07:00:00-05:00", location: "A120", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 10, title: "Lunch", description:"Pizza from East Lansing's famous Pizza House.", time: "2017-01-21T12:00:00-05:00", location: "B Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 11, title: "Dinner", description:"Description for SpartaHack's delicious dinner.", time: "2017-01-21T18:00:00-05:00", location: "B Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 12, title: "Midnight Snack", description:"", time: "2017-01-22T00:00:00-05:00", location: "B Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 13, title: "Breakfast", description:"", time: "2017-01-22T07:00:00-05:00", location: "A120", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 14, title: "Lunch", description:"", time: "2017-01-22T11:30:00-05:00", location: "Bus Loop Stairwell", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 15, title: "Judging", description:"", time: "2017-01-22T13:00:00-05:00", location: "B Hallway & Atrium", updatedAt: "2016-08-29T02:48:43+00:00"},
      { id: 16, title: "Closing Ceremony", description:"Good luck and thank you for attending SpartaHack!", time: "2017-01-22T16:00:00-05:00", location: "B115", updatedAt: "2016-08-29T02:48:43+00:00"}
    ] }, status: 200
  end

end
