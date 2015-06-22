class TeaplesController < ApplicationController

  def index
    @teaples = Teaple.all
  end

  # def new
  # end

  def create
    Teaple.create(teaple_params)
    redirect_to '/'
  end

  def teaple_params
    params.require(:teaple).permit(:name)
  end

end
