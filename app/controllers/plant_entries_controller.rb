class PlantEntriesController < ApplicationController

  before_action :find_and_set_plant_entry

  def index
    @plant_entries = @plant.plant_entries.all
  end

  def new
    @plant_entry = @plant.plant_entries.new
    @plant_entry.plant_tasks.build
    @plant_entry.feedings.build
    @plant_entry.plant_tasks.build
    @plant_entry.stage_of_growths.build
    @plant_entry.plant_images.build
    @plant_entry.sprayings.build
    @plant_entry.general_notes.build
  end

  def create
    @plant_entry = @plant.plant_entries.new(plant_entry_params)
    if @plant_entry.save
      flash[:notice] = 'Plant entry were successfully added'
      redirect_to plant_plant_entries_path
    else
      render :new
    end
  end

  def edit
    @plant_entry = @plant.plant_entries.find(params[:id])
  end

  def show
    @plant_entry = @plant.plant_entries.find(params[:id])
  end

  def update
    @plant_entry = @plant.plant_entries.find(params[:id])
    if @plant_entry.update(plant_entry_params)
      flash[:notice] = 'Plant entry were successfully updated!'
      redirect_to plant_plant_entries_path
    else
      render :edit
    end
  end

  def destroy
    plant_entry = @plant.plant_entries.find(params[:id])
    plant_entry.destroy
    flash[:error] = "Plant entry was deleted"
    redirect_to plant_plant_entries_path
  end

  private

  def plant_entry_params
    params.require(:plant_entry).permit(:entry_datetime, :plant_id, general_notes: [:id, :notes, :plant_entry_id])
  end

  def find_and_set_plant_entry
    @plant = Plant.find(params[:plant_id])
  end

end
