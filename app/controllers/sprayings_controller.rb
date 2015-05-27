class SprayingsController < ApplicationController

  before_action :find_and_set_spraying

  def index
    @sprayings = @plant_entry.sprayings.all
  end

  def new
    @spraying = @plant_entry.sprayings.new
  end

  def create
    @spraying = @plant_entry.sprayings.new(spraying_params)
    if @spraying.save
      flash[:notice] = 'Spraying successfully added'
      redirect_to plant_entry_sprayings_path
    else
      render :new
    end
  end

  def edit
    @spraying = @plant_entry.sprayings.find(params[:id])
  end

  def show
    @spraying = @plant_entry.sprayings.find(params[:id])
  end

  def update
    @spraying = @plant_entry.sprayings.find(params[:id])
    if @spraying.update(spraying_params)
      flash[:notice] = 'Spraying successfully updated!'
      redirect_to plant_entry_sprayings_path
    else
      render :edit
    end
  end

  def destroy
    spraying = @plant_entry.sprayings.find(params[:id])
    spraying.destroy
    flash[:error] = "Spraying was deleted"
    redirect_to plant_entry_spraying_path
  end

  private

  def spraying_params
    params.require(:spraying).permit(:water_amount, :chemicals_used, :plant_entry_id)
  end

  def find_and_set_spraying
    @plant_entry = PlantEntry.find(params[:plant_entry_id])
  end

end
