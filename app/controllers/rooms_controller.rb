class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_room, only: [:show, :edit, :update, :destroy]
  
    def index
      @rooms = Room.all
    end
  
    def show
      @message = Message.new
      @messages = @room.messages.order(created_at: :asc)
    end
  
    def new
      @room = Room.new
    end
  
    def create
      @room = Room.new(room_params)
      if @room.save
        redirect_to @room, notice: 'Room was successfully created.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @room.update(room_params)
        redirect_to @room, notice: 'Room was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @room.destroy
      redirect_to rooms_url, notice: 'Room was successfully destroyed.'
    end
  
    private
  
    def set_room
      @room = Room.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:name)
    end
end
