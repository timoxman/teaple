class MessagesController < ApplicationController

  def new
    #this @teaple is lost when the page is rendered?
    @teaple = Teaple.find(params[:teaple_id])
    @message = Message.new
  end

  def create
    @teaple = Teaple.find(params[:teaple_id])
    @teaple.messages.create(message_params)
    flash[:notice] = "Thanks for sending a message to #{@teaple.name}!"
    if current_user.id == @teaple.user_id
      redirect_to teaple_messages_path(@teaple)
    else
      flash[:notice] = "Your message has been sent"
      redirect_to teaples_path()
    end
  end

  def message_params
    params.require(:message).permit(:messageText)
  end

  def index
    @teaple = Teaple.find(params[:teaple_id])
    if user_signed_in?
      if current_user.id == @teaple.user_id
        @messages = Message.where(teaple_id: @teaple.id).find_each
      else
        flash[:notice] = "You must be logged in as the user who created the teaple to see their messages"
        redirect_to '/'
      end
    else
      flash[:notice] = "You must be logged in to see Teaple messages"
      redirect_to '/'
    end
  end

end
