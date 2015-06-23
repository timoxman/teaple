class MessagesController < ApplicationController

  def new
    @teaple = Teaple.find(params[:teaple_id])
    @message = Message.new
  end

  def create
    @teaple = Teaple.find(params[:teaple_id])
    @teaple.messages.create(message_params)
    flash[:notice] = "Thanks for sending a message to #{@teaple.name}!"
    redirect_to teaple_messages_path(@teaple)
  end

  def message_params
    params.require(:message).permit(:messageText)
  end

  def index
    @teaple = Teaple.find(params[:teaple_id])
    if current_user.id == @teaple.user_id
      @messages = Message.where(teaple_id: @teaple.id).find_each
    else
      flash[:notice] = "You must be logged in as the user who created the teaple to see their messages"
      redirect_to '/'
    end
  end

end
