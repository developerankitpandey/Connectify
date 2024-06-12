// app/assets/javascripts/channels/conversation.js

import consumer from "./consumer";

document.addEventListener('turbolinks:load', () => {
  const conversationElement = document.getElementById('conversation');
  const conversationId = conversationElement.dataset.conversationId;

  if (conversationId) {
    consumer.subscriptions.create({ channel: "ConversationChannel", conversation_id: conversationId }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const messageElement = document.createElement('div');
        messageElement.innerHTML = data.message;
        conversationElement.appendChild(messageElement);
      }
    });
  }
});
