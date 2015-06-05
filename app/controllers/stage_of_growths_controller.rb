class StageOfGrowthsController < ApplicationController

  def index
    @stage_of_growths = StageOfGrowths.all
  end

  def new
    @stage_of_growth = StageOfGrowth.new
    # @grow_media = @plant_entry.grow_medium.new(params.require(:grow_media).permit(:brand, :nutrients_added, :plant_entry_id))
  end

  def create
    @stage_of_growth = StageOfGrowth.new(stage_of_growth_params)
    if @stage_of_growth.save
      flash[:notice] = 'Stage of Growth successfully created'
      redirect_to plant_entry_stage_of_growths_path
    else
      render :new
    end
  end

  def edit
    @stage_of_growth = StageOfGrowth.find(params[:id])
  end

  def show
    @stage_of_growth = StageOfGrowth.find(params[:id])
    # @grow_medium = GrowMedia.find(params[:id])
  end

  def update
    @stage_of_growth = StageOfGrowth.find(params[:id])
    if @stage_of_growth.update(stage_of_growth_params)
      flash[:notice] = 'Stage of Growth Successfully updated!'
      redirect_to plant_entry_stage_of_growths_path
    else
      render :edit
    end
  end

  def destroy
    stage_of_growth = StageOfGrowth.find(params[:id])
    stage_of_growth.destroy
    flash[:error] = "Stage of Growth was deleted"
    redirect_to plant_entry_stage_of_growths_path
  end

  private

  def stage_of_growth_params
    params.require(:stage_of_growth).permit(:stage, :plant_entry_date, :pot_size, :grow_medium, :nutrients_added :plant_entry_id)
  end

end
