class PlantTasksController < ApplicationController

  before_action :find_and_set_plant_task

  def index
    @plant_tasks = @plant.plant_tasks.all
  end

  def new
    @plant_task = @plant.plant_tasks.new
  end

  def create
    @plant_task = @plant.plant_tasks.new(plant_task_params)
    if @plant_task.save
      flash[:notice] = 'Plant Tasks were successfully added'
      redirect_to plant_plant_tasks_path
    else
      render :new
    end
  end

  def edit
    @plant_task = @plant.plant_tasks.find(params[:id])
  end

  def show
    @plant_task = @plant.plant_tasks.find(params[:id])
  end

  def update
    @plant_task = @plant.plant_tasks.find(params[:id])
    if @plant_task.update(plant_task_params)
      flash[:notice] = 'Plant Tasks were successfully updated!'
      redirect_to plant_plant_tasks_path
    else
      render :edit
    end
  end

  def destroy
    plant_task = @plant.plant_tasks.find(params[:id])
    plant_task.destroy
    flash[:error] = "Plant Tasks was deleted"
    redirect_to plant_plant_tasks_path
  end

  private

  def plant_task_params
    params.require(:plant_task).permit(:trimmed, :topped, :staked, :clipped, :plant_id)
  end

  def find_and_set_plant_task
    @plant = Plant.find(params[:plant_id])
  end

end
