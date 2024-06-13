class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for "chat_#{params['room']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = Message.create!(content: data['message'], user_id: current_user.id, room_id: data['room'])
    ActionCable.server.broadcast "chat_#{data['room']}_channel", message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
