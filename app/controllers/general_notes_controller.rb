class GeneralNotesController < ApplicationController

  def index
    @general_notes = GeneralNotes.all
  end

  def new
    @general_note = GeneralNote.new
  end

  def create
    @general_note = GeneralNote.new(general_note_params)
    if @general_note.save
      flash[:notice] = 'General Note successfully added'
      redirect_to plant_entry_general_notes_path
    else
      render :new
    end
  end

  def edit
    @general_note = GeneralNote.find(params[:id])
  end

  def show
    @general_note = GeneralNote.find(params[:id])
  end

  def update
    @general_note = GeneralNote.find(params[:id])
    if @general_note.update(general_note_params)
      flash[:notice] = 'General Notes successfully updated!'
      redirect_to plant_entry_general_notes_path
    else
      render :edit
    end
  end

  def destroy
    general_note = GeneralNote.find(params[:id])
    general_note.destroy
    flash[:error] = "General Notes was deleted"
    redirect_to plant_entry_general_note_path
  end

  private

  def general_note_params
    params.require(:general_note).permit(:notes, :plant_entry_id)
  end

end
