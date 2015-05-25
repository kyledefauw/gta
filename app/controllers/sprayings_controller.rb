class SprayingsController < ApplicationController

  before_action :find_and_set_spraying

  def index
    @sprayings = @plant.sprayings.all
  end

  def new
    @spraying = @plant.sprayings.new
  end

  def create
    @spraying = @plant.sprayings.new(spraying_params)
    if @spraying.save
      flash[:notice] = 'Spraying successfully added'
      redirect_to plant_sprayings_path
    else
      render :new
    end
  end

  def edit
    @spraying = @plant.sprayings.find(params[:id])
  end

  def show
    @spraying = @plant.sprayings.find(params[:id])
  end

  def update
    @spraying = @plant.sprayings.find(params[:id])
    if @spraying.update(spraying_params)
      flash[:notice] = 'Spraying successfully updated!'
      redirect_to plant_sprayings_path
    else
      render :edit
    end
  end

  def destroy
    spraying = @plant.sprayings.find(params[:id])
    spraying.destroy
    flash[:error] = "Spraying was deleted"
    redirect_to plant_spraying_path
  end

  private

  def spraying_params
    params.require(:spraying).permit(:notes, :plant_id)
  end

  def find_and_set_spraying
    @plant = Plant.find(params[:plant_id])
  end

end
