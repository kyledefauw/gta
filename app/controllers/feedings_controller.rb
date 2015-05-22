class FeedingsController < ApplicationController

  before_action :find_and_set_feeding

  def index
    @feedings = @plant_task.feedings.all
  end

  def new
    @feeding = @plant_task.feedings.new
  end

  def create
    @feeding = @plant_task.feedings.new(feeding_params)
    if @feeding.save
      flash[:notice] = 'Feeding successfully added'
      redirect_to plant_task_feedings_path
    else
      render :new
    end
  end

  def edit
    @feeding = @plant_task.feedings.find(params[:id])
  end

  def show
    @feeding = @plant_task.feedings.find(params[:id])
  end

  def update
    @feeding = @plant_task.feedings.find(params[:id])
    if @feeding.update(feeding_params)
      flash[:notice] = 'Feeding successfully updated!'
      redirect_to plant_task_feedings_path
    else
      render :edit
    end
  end

  def destroy
    feeding = @plant_task.feedings.find(params[:id])
    feeding.destroy
    flash[:error] = "Feeding was deleted"
    redirect_to plant_task_feedings_path
  end

  private

  def feeding_params
    params.require(:feeding).permit(:water_amount, :nutrients_added, :ppm_level, :ph_level, :plant_task_id)
  end

  def find_and_set_feeding
    @plant_task = PlantTask.find(params[:plant_task_id])
  end

end
