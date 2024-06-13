class ConversationChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find_by(id: params[:conversation_id])
    stream_from conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
