App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append $('<div class="message"></div>').text(data['message'])

  post: (message) ->
    @perform 'post', message: message

$(document).on 'keypress', '[data-behavior~=message_input]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.post event.target.value
    event.target.value = ''
    event.preventDefault()
