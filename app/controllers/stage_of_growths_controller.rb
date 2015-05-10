class StageofGrowthsController < ApplicationController

  before_action :find_and_set_stage_of_growth

  def index
    @stage_of_growths = @plant.stage_of_growths.all
  end

  def new
    @stage_of_growth = @plant.stage_of_growths.new
  end

  def create
    @stage_of_growth = @plant.stage_of_growths.new(stage_of_growth_params)
    if @stage_of_growth.save
      flash[:notice] = 'Stage of Growth successfully created'
      redirect_to plant_stage_of_growths_path
    else
      render :new
    end
  end

  def edit
    @stage_of_growth = @plant.stage_of_growths.find(params[:id])
  end

  def show
    @stage_of_growth = @plant.stage_of_growths.find(params[:id])
  end

  def update
    @stage_of_growth = @plant.stage_of_growths.find(params[:id])
    if @stage_of_growth.update(stage_of_growth_params)
      flash[:notice] = 'Stage of Growth Successfully updated!'
      redirect_to plant_stage_of_growths_path
    else
      render :edit
    end
  end

  def destroy
    stage_of_growth = @plant.stage_of_growths.find(params[:id])
    stage_of_growth.destroy
    flash[:error] = "Stage of Growth was deleted"
    redirect_to plant_stage_of_growths_path
  end

  private

  def stage_of_growth_params
    params.require(:stage_of_growth).permit(:stage, :plant_date, :pot_size, :grow_medium)
  end

  def find_and_set_stage_of_growth
    @plant = plant.find(params[:plant_id])
  end

end
