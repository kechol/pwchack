class MessagesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
      @room = Room.find_by(uuid: params[:uuid])
      @messages = Message.where(room: @room)
    end
end
