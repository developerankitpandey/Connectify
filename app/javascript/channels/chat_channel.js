import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const roomElement = document.getElementById('room-id');
  if (roomElement) {
    const roomId = roomElement.getAttribute('data-room-id');

    consumer.subscriptions.create({ channel: "ChatChannel", room: roomId }, {
      connected() {
        console.log("Connected to the chat channel.");
      },

      disconnected() {
        console.log("Disconnected from the chat channel.");
      },

      received(data) {
        const messagesContainer = document.getElementById('messages');
        messagesContainer.insertAdjacentHTML('beforeend', data.message);
      }
    });

    const messageForm = document.getElementById('new_message');
    messageForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const messageContent = document.getElementById('message_content');
      consumer.subscriptions.subscriptions[0].send({
        message: messageContent.value,
        room: roomId
      });
      messageContent.value = '';
    });
  }
});
