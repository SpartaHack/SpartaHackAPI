class Api::V1::ScheduleController < ApplicationController

  # GET /schedules
  def index
    render json: { schedule: [
      { id: 1, title: "Sponsor Registration", description:"", time: "2017-01-20T23:00:00.000Z", location: "Bus Loop Stairwell", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 2, title: "Hacker Registration", description:"Check in using the mobile app by showing your QR Code!", time: "2017-01-20T23:00:00.000Z", location: "B Hall / Main Stairwell", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 3, title: "Dinner", description:"", time: "2017-01-21T00:00:00.000Z", location: "B Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 4, title: "Opening Ceremony", description:"", time: "2017-01-21T02:00:00.000Z", location: "B115", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 5, title: "Team Building", description:"", time: "2017-01-21T03:00:00.000Z", location: "B115", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 6, title: "Hacking Begins", description:"Let SpartaHack17 Begin!", time: "2017-01-21T05:00:00.000Z", location: "", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 7, title: "Midnight Snack", description:"", time: "2017-01-21T05:00:00.000Z", location: "B Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 8, title: "Nap Rooms", description:"Inflatable mattresses and blankets provided!", time: "2017-01-21T06:00:00.000Z", location: "3rd Floor A Wing", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 9, title: "Breakfast", description:"The most important meal of the day.", time: "2017-01-21T12:00:00.000Z", location: "A120", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 10, title: "Lunch", description:"Pizza from East Lansing's famous Pizza House.", time: "2017-01-21T17:00:00.000Z", location: "B Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 11, title: "Dinner", description:"Description for SpartaHack's delicious dinner.", time: "2017-01-21T23:00:00.000Z", location: "B Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 12, title: "Midnight Snack", description:"", time: "2017-01-22T05:00:00.000Z", location: "B Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 13, title: "Breakfast", description:"", time: "2017-01-22T12:00:00.000Z", location: "A120", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 14, title: "Lunch", description:"", time: "2017-01-22T16:00:00.000Z", location: "Bus Loop Stairwell", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 15, title: "Judging", description:"", time: "2017-01-22T18:00:00.000Z", location: "B Hallway & Atrium", updatedAt: "2016-08-29T02:48:43.000Z"},
      { id: 16, title: "Closing Ceremony", description:"Good luck and thank you for attending SpartaHack!", time: "2017-01-22T21:00:00.000Z", location: "B115", updatedAt: "2016-08-29T02:48:43.000Z"}
    ] }, status: 200
  end

end
