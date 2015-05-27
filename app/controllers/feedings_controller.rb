class FeedingsController < ApplicationController

  before_action :find_and_set_feeding

  def index
    @feedings = @plant_entry.feedings.all
  end

  def new
    @feeding = @plant_entry.feedings.new
  end

  def create
    @feeding = @plant_entry.feedings.new(feeding_params)
    if @feeding.save
      flash[:notice] = 'Feeding successfully added'
      redirect_to plant_entry_feedings_path
    else
      render :new
    end
  end

  def edit
    @feeding = @plant_entry.feedings.find(params[:id])
  end

  def show
    @feeding = @plant_entry.feedings.find(params[:id])
  end

  def update
    @feeding = @plant_entry.feedings.find(params[:id])
    if @feeding.update(feeding_params)
      flash[:notice] = 'Feeding successfully updated!'
      redirect_to plant_entry_feedings_path
    else
      render :edit
    end
  end

  def destroy
    feeding = @plant_entry.feedings.find(params[:id])
    feeding.destroy
    flash[:error] = "Feeding was deleted"
    redirect_to plant_entry_feedings_path
  end

  private

  def feeding_params
    params.require(:feeding).permit(:water_amount, :nutrients_added, :ppm_level, :ph_level, :plant_entry_id)
  end

  def find_and_set_feeding
    @plant_entry = Plantentry.find(params[:plant_entry_id])
  end

end
