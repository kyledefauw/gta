class FeedingsController < ApplicationController

  def index
    @feedings = Feedings.all
  end

  def new
    @feeding = Feeding.new
  end

  def create
    @feeding = Feeding.new(feeding_params)
    if @feeding.save
      flash[:notice] = 'Feeding successfully added'
      redirect_to plant_entry_feedings_path
    else
      render :new
    end
  end

  def edit
    @feeding = Feeding.find(params[:id])
  end

  def show
    @feeding = Feeding.find(params[:id])
  end

  def update
    @feeding = Feeding.find(params[:id])
    if @feeding.update(feeding_params)
      flash[:notice] = 'Feeding successfully updated!'
      redirect_to plant_entry_feedings_path
    else
      render :edit
    end
  end

  def destroy
    feeding = Feeding.find(params[:id])
    feeding.destroy
    flash[:error] = "Feeding was deleted"
    redirect_to plant_entry_feedings_path
  end

  private

  def feeding_params
    params.require(:feeding).permit(:water_amount, :nutrients_added, :ppm_level, :ph_level, :plant_entry_id)
  end

end
