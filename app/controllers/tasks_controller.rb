class TasksController < ApplicationController

  before_action :find_and_set_task

  def index
    @tasks = @plant.tasks.all
  end

  def new
    @task = @plant.tasks.new
  end

  def create
    @task = @plant.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Tasks were successfully added'
      redirect_to plant_tasks_path
    else
      render :new
    end
  end

  def edit
    @task = @plant.tasks.find(params[:id])
  end

  def show
    @task = @plant.tasks.find(params[:id])
  end

  def update
    @task = @plant.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = 'Tasks were successfully updated!'
      redirect_to plant_tasks_path
    else
      render :edit
    end
  end

  def destroy
    task = @plant.tasks.find(params[:id])
    task.destroy
    flash[:error] = "Tasks was deleted"
    redirect_to plant_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:trimmed, :topped, :staked, :clipped, :plant_id)
  end

  def find_and_set_task
    @plant = Plant.find(params[:plant_id])
  end

end
