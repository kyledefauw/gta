class GeneralNotesController < ApplicationController

  before_action :find_and_set_general_note

  def index
    @general_notes = @plant.general_notes.all
  end

  def new
    @general_note = @plant.general_notes.new
  end

  def create
    @general_note = @plant.general_notes.new(general_note_params)
    if @general_note.save
      flash[:notice] = 'General Note successfully added'
      redirect_to plant_general_notes_path
    else
      render :new
    end
  end

  def edit
    @general_note = @plant.general_notes.find(params[:id])
  end

  def show
    @general_note = @plant.general_notes.find(params[:id])
  end

  def update
    @general_note = @plant.general_notes.find(params[:id])
    if @general_note.update(general_note_params)
      flash[:notice] = 'General Notes successfully updated!'
      redirect_to plant_general_notes_path
    else
      render :edit
    end
  end

  def destroy
    general_note = @plant.general_notes.find(params[:id])
    general_note.destroy
    flash[:error] = "General Notes was deleted"
    redirect_to plant_general_note_path
  end

  private

  def general_note_params
    params.require(:general_note).permit(:notes, :plant_id)
  end

  def find_and_set_general_note
    @plant = Plant.find(params[:plant_id])
  end

end
