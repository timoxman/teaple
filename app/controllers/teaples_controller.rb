class TeaplesController < ApplicationController

  def index
    @teaples = Teaple.all
  end

  def new
    @teaple = Teaple.new
  end

  def show
    @teaple = Teaple.find(params[:id])
    @creator = User.find(@teaple.user_id).email
  end

  def create
    if current_user
      @teaple = Teaple.create(teaple_params.merge({user_id:current_user.id}))
      flash[:notice] = "Thanks for signing up, #{@teaple.name}!"
    else
      flash[:notice] = "Only logged in users can sign up Teaple"
    end
    redirect_to '/'
  end

  def teaple_params
    params.require(:teaple).permit(:name, :bio, :location, :postcode)
  end

end
