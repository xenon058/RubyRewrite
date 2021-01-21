class RoomController < ApplicationController
    before_action :ownerclear
  def index
      session.clear
  end
  def roomList
      if params[:id]
          @rooms = Room.where(type_id: params[:id])
      else
          @rooms = Room.all
      end
  end
  def roomDetail
    @room = Room.find_by(no: params[:no])
  end
end
