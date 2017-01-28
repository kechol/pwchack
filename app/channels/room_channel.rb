class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:room]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    @room = Room.find_by(uuid: params[:room])
    msg = Message.create!({
      room: @room,
      content: data['content'],
      bot_flg: !!data['bot_flg'],
      intent: data['intent']
    })
    ActionCable.server.broadcast params[:room], message: msg.as_json

    if !data['bot_flg'] && data['intent'] == 'text'
      @luis = AzureLuisService.new
      resp = @luis.answer(data['content']['text'])
      msg = Message.create!({
        room: @room,
        bot_flg: true,
        intent: resp['intents'][0]['intent'],
        content: resp['entities'][0]
      })
      ActionCable.server.broadcast params[:room], message: msg.as_json
    end
  end
end
