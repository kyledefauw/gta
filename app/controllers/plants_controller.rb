class PlantsController < ApplicationController

  before_action :find_and_set_plant

  def index
    @plants = @crop.plants.all
    @latest_stage = StageOfGrowth.last
    @last_fed = Feeding.last
  end

  def new
    @plant = @crop.plants.new
  end

  def create
    @plant = @crop.plants.new(plant_params)
    if @plant.save
      flash[:notice] = 'Plant successfully created'
      redirect_to crop_plants_path
    else
      render :new
    end
  end

  def edit
    @plant = @crop.plants.find(params[:id])
  end

  def show
    @plant = @crop.plants.find(params[:id])
  end

  def update
    @plant = @crop.plants.find(params[:id])
    if @plant.update(plant_params)
      flash[:notice] = 'Plant Successfully updated!'
      redirect_to crop_plants_path
    else
      render :edit
    end
  end

  def destroy
    plant = @crop.plants.find(params[:id])
    plant.destroy
    flash[:error] = "Plant was deleted"
    redirect_to crop_plants_path
  end

  def copy
    @plant = @crop.plants.find(params[:id])
    @dup_plant = @plant.amoeba_dup
    render 'new'
  end

  private

  def plant_params
    params.require(:plant).permit(:strain_name, :sex, :from, :crop_id, :id_number)
  end

  def find_and_set_plant
    @crop = Crop.find(params[:crop_id])
  end

  end
