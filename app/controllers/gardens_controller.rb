class GardensController < ApplicationController

  before_action :find_and_set_garden

  def index
    @gardens =
      if current_user
        @user.gardens.where(user_id: current_user.id)
      else
        []
      end
  end

  def new
    @garden = @user.gardens.new
  end

  def create
    @garden = @user.gardens.new(garden_params)
    if @garden.save
      flash[:notice] = 'You successfully created a new garden!'
      redirect_to gardens_path
    else
      render :new
    end
  end

  def edit
    @garden = @user.gardens.find(params[:id])
  end

  def show
    @garden = @user.gardens.find(params[:id])
  end

  def update
    @garden = @user.gardens.find(params[:id])
    if @garden.update(garden_params)
      flash[:notice] = '@user.gardens successfully updated'
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    garden = @user.gardens.find(params[:id])
    garden.delete
    redirect_to gardens_path, notice: 'Garden deleted'
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :user_id)
  end

  def find_and_set_garden
    @user = User.find(session[:user_id])
  end

end
