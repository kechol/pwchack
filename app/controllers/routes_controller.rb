class RoutesController < ApplicationController

  def search
  end

  def map
    @room = Room.find_by(uuid: params[:uuid])
    @messages = Message.where(room: @room)
  end

  def create
    @room = Room.create(uuid: SecureRandom.uuid)
    redirect_to routes_map_path(uuid: @room.uuid, dest: params[:destination])
  end

  def debug
    @room = Room.last
    redirect_to routes_map_path(uuid: @room.uuid, bot: true)
  end
end
