// app/javascript/channels/conversation_channel.js
import consumer from "./consumer"

document.addEventListener('DOMContentLoaded', () => {
  const conversationId = document.getElementById('conversation_id').value;

consumer.subscriptions.create({ channel: "ConversationChannel", conversation_id: conversationId }, {
  received(data) {
    // Insert the message into the DOM
    $('#messages').append(data.message);
  }
});

});