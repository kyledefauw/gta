class GrowMediumController < ApplicationController

  before_action :find_and_set_grow_medium

  def index
    @grow_mediums = @plant.grow_mediums.all
  end

  def new
    @grow_medium = @plant.grow_mediums.new
  end

  def create
    @grow_medium = @plant.grow_mediums.new(grow_medium_params)
    if @grow_medium.save
      flash[:notice] = 'Grow Medium successfully added'
      redirect_to plant_grow_mediums_path
    else
      render :new
    end
  end

  def edit
    @grow_medium = @plant.grow_mediums.find(params[:id])
  end

  def show
    @grow_medium = @plant.grow_mediums.find(params[:id])
  end

  def update
    @grow_medium = @plant.grow_mediums.find(params[:id])
    if @grow_medium.update(grow_medium_params)
      flash[:notice] = 'Grow Medium successfully updated!'
      redirect_to plant_grow_mediums_path
    else
      render :edit
    end
  end

  def destroy
    grow_medium = @plant.grow_mediums.find(params[:id])
    grow_medium.destroy
    flash[:error] = "grow_medium was deleted"
    redirect_to plant_grow_mediums_path
  end

  private

  def grow_medium_params
    params.require(:grow_media).permit(:brand, :nutrients_added, :plant_id)
  end

  def find_and_set_grow_medium
    @plant = Plant.find(params[:plant_id])
  end

end
