class FeedingsController < ApplicationController

  before_action :find_and_set_feeding

  def index
    @feedings = @plant.feedings.all
  end

  def new
    @feeding = @plant.feedings.new
  end

  def create
    @feeding = @plant.feedings.new(feeding_params)
    if @feeding.save
      flash[:notice] = 'Feeding successfully added'
      redirect_to plant_feedings_path
    else
      render :new
    end
  end

  def edit
    @feeding = @plant.feedings.find(params[:id])
  end

  def show
    @feeding = @plant.feedings.find(params[:id])
  end

  def update
    @feeding = @plant.feedings.find(params[:id])
    if @feeding.update(feeding_params)
      flash[:notice] = 'Feeding successfully updated!'
      redirect_to plant_feedings_path
    else
      render :edit
    end
  end

  def destroy
    feeding = @plant.feedings.find(params[:id])
    feeding.destroy
    flash[:error] = "Feeding was deleted"
    redirect_to plant_feedings_path
  end

  private

  def feeding_params
    params.require(:feeding).permit(:water_amount, :nutrients_added, :ppm_level, :ph_level, :plant_id)
  end

  def find_and_set_feeding
    @plant = Plant.find(params[:plant_id])
  end

end
