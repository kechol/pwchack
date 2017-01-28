App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    $('#messages').append $('<div class="message me"></div>').append($('<div class="message-body text"></div>').text(data['message']))

  post: (message) ->
    @perform 'post', message: message

$(document).on 'submit', '#chat_input', (evt) ->
  evt.preventDefault()
  console.log(evt.target, $('#chat_new_message').val())
  App.room.post $('#chat_new_message').val()
  $('#chat_new_message').val('')
