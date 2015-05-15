class GeneralNotesController < ApplicationController

  before_action :find_and_set_general_notes

  def index
    @general_notess = @plant.general_notess.all
  end

  def new
    @general_notes = @plant.general_notess.new
  end

  def create
    @general_notes = @plant.general_notess.new(general_notes_params)
    if @general_notes.save
      flash[:notice] = 'General Notes successfully added'
      redirect_to plant_general_notess_path
    else
      render :new
    end
  end

  def edit
    @general_notes = @plant.general_notess.find(params[:id])
  end

  def show
    @general_notes = @plant.general_notess.find(params[:id])
  end

  def update
    @general_notes = @plant.general_notess.find(params[:id])
    if @general_notes.update(general_notes_params)
      flash[:notice] = 'General Notes successfully updated!'
      redirect_to plant_general_notess_path
    else
      render :edit
    end
  end

  def destroy
    general_notes = @plant.general_notess.find(params[:id])
    general_notes.destroy
    flash[:error] = "General Notes was deleted"
    redirect_to plant_general_notess_path
  end

  private

  def general_notes_params
    params.require(:general_notes).permit(:notes, :plant_id)
  end

  def find_and_set_general_notes
    @plant = Plant.find(params[:plant_id])
  end

end
