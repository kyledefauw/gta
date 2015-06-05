class SprayingsController < ApplicationController

  def index
    @sprayings = Sprayings.all
  end

  def new
    @spraying = Spraying.new
  end

  def create
    @spraying = Spraying.new(spraying_params)
    if @spraying.save
      flash[:notice] = 'Spraying successfully added'
      redirect_to plant_entry_sprayings_path
    else
      render :new
    end
  end

  def edit
    @spraying = Spraying.find(params[:id])
  end

  def show
    @spraying = Spraying.find(params[:id])
  end

  def update
    @spraying = Spraying.find(params[:id])
    if @spraying.update(spraying_params)
      flash[:notice] = 'Spraying successfully updated!'
      redirect_to plant_entry_sprayings_path
    else
      render :edit
    end
  end

  def destroy
    spraying = Spraying.find(params[:id])
    spraying.destroy
    flash[:error] = "Spraying was deleted"
    redirect_to plant_entry_spraying_path
  end

  private

  def spraying_params
    params.require(:spraying).permit(:water_amount, :chemicals_used, :plant_entry_id)
  end

end
