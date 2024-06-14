class MessagesController < ApplicationController
  before_action :set_conversation

  def index
    @messages = @conversation&.messages&.order(created_at: :asc)
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      ActionCable.server.broadcast "conversation_#{@conversation.id}", render_message(@message)
      redirect_to conversation_messages_path
    else
      @messages = @conversation.messages.order(created_at: :asc)
      render :index
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    MessagesController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
