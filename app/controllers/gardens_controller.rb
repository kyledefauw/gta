class GardensController < ApplicationController

  before_action :find_and_set_user
  
  def index
    @gardens =
      if current_user
        Garden.where(user_id: current_user.id)
      else
        []
      end
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      flash[:notice] = 'You successfully created a new garden!'
      redirect_to gardens_path
    else
      render :new
    end
  end

  def edit
    @garden = Garden.find(params[:id])
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def update
    @garden = Garden.find(params[:id])
    if @garden.update(garden_params)
      flash[:notice] = 'Garden successfully updated'
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    garden = Garden.find(params[:id])
    garden.delete
    redirect_to gardens_path, notice: 'Garden deleted'
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :user_id)
  end

  def find_and_set_user
    @user = User.find(params[:user_id])
  end

end
