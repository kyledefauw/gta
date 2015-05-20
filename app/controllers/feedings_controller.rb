class FeedingsController < ApplicationController

  before_action :find_and_set_feeding

  def index
    @feedings = @task.feedings.all
  end

  def new
    @feeding = @task.feedings.new
  end

  def create
    @feeding = @task.feedings.new(feeding_params)
    if @feeding.save
      flash[:notice] = 'Feeding successfully added'
      redirect_to task_feedings_path
    else
      render :new
    end
  end

  def edit
    @feeding = @task.feedings.find(params[:id])
  end

  def show
    @feeding = @task.feedings.find(params[:id])
  end

  def update
    @feeding = @task.feedings.find(params[:id])
    if @feeding.update(feeding_params)
      flash[:notice] = 'Feeding successfully updated!'
      redirect_to task_feedings_path
    else
      render :edit
    end
  end

  def destroy
    feeding = @task.feedings.find(params[:id])
    feeding.destroy
    flash[:error] = "Feeding was deleted"
    redirect_to task_feedings_path
  end

  private

  def feeding_params
    params.require(:feeding).permit(:water_amount, :nutrients_added, :ppm_level, :ph_level, :task_id)
  end

  def find_and_set_feeding
    @task = task.find(params[:task_id])
  end

end
