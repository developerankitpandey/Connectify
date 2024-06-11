class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_room
  
    def create
      @message = @room.messages.build(message_params)
      @message.user = current_user
      if @message.save
        ActionCable.server.broadcast "chat_#{@room.id}_channel", message: render_message(@message)
        head :ok
      else
        redirect_to @room, alert: 'Message could not be sent.'
      end
    end
  
    private
  
    def set_room
      @room = Room.find(params[:room_id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
  
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end

end
