class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    @room = Room.find_by(uuid: params[:room])
    Message.create! room: @room, content: data['content'], bot_flg: !!data['bot_flg'], type: data['type']
    ActionCable.server.broadcast params[:room], message: data
  end
end
