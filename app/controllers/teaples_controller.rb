class TeaplesController < ApplicationController

  def index
    @teaples = Teaple.all
  end

  def new
    @teaple = Teaple.new
  end

  def show
    @teaple = Teaple.find(params[:id])
  end

  def create
    byebug
    @teaple = Teaple.create(teaple_params)
    flash[:notice] = "Thanks for signing up, #{@teaple.name}!"
    redirect_to '/'
  end

  def teaple_params
    params.require(:teaple).permit(:name, :bio, :location, :postcode)
  end



end
