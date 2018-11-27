class RoomsController < ApplicationController
  before_action :find_room, only: [:show]
  def show
    @message = Message.new
  end

  def create
    users = [
      User.find(room_params[:user_id]),
      current_user
    ]
    redirect_to Room.get_or_create!(users)
  end

  private

  def room_params
    params.require(:room).permit(:user_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end
end
