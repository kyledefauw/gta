class PlantTasksController < ApplicationController

  def index
    @plant_tasks = PlantTasks.all
  end

  def new
    @plant_task = PlantTask.new
  end

  def create
    @plant_task = PlantTask.new(plant_task_params)
    if @plant_task.save
      flash[:notice] = 'Plant Tasks were successfully added'
      redirect_to plant_entry_plant_tasks_path
    else
      render :new
    end
  end

  def edit
    @plant_task = PlantTask.find(params[:id])
  end

  def show
    @plant_task = PlantTask.find(params[:id])
  end

  def update
    @plant_task = PlantTask.find(params[:id])
    if @plant_task.update(plant_task_params)
      flash[:notice] = 'Plant Tasks were successfully updated!'
      redirect_to plant_entry_plant_tasks_path
    else
      render :edit
    end
  end

  def destroy
    plant_task = PlantTask.find(params[:id])
    plant_task.destroy
    flash[:error] = "Plant Tasks was deleted"
    redirect_to plant_entry_plant_tasks_path
  end

  private

  def plant_task_params
    params.require(:plant_task).permit(:trimmed, :topped, :staked, :clipped, :plant_entry_id)
  end

end
