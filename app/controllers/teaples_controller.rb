class TeaplesController < ApplicationController

  def index
    # @teaples = Teaple.all
  end

  # def new
  # end

  def create
    @teaple = Teaple.create(teaple_params)
    flash[:notice] = "Thanks for signing up, #{@teaple.name}!"
    redirect_to '/'
  end

  def teaple_params
    params.require(:teaple).permit(:name)
  end



end
