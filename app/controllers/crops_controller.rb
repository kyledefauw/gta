class CropsController < ApplicationController

  before_action :find_and_set_crop

  def index
    @crops = @garden.crops.all
  end

  def new
    @crop = @garden.crops.new
  end

  def create
    @crop = @garden.crops.new(crop_params)
    if @crop.save
      flash[:notice] = 'Crop successfully created'
      redirect_to garden_crops_path
    else
      render :new
    end
  end

  def edit
    @crop = @garden.crops.find(params[:id])
  end

  def show
    @crop = @garden.crops.find(params[:id])
  end

  def update
    @crop = @garden.crops.find(params[:id])
    if @crop.update(crop_params)
      flash[:notice] = 'Crop Successfully updated!'
      redirect_to garden_crops_path
    else
      render :edit
    end
  end

  def destroy
    crop = @garden.crops.find(params[:id])
    crop.destroy
    flash[:error] = "Crop was deleted"
    redirect_to garden_crops_path
  end

  private

  def crop_params
    params.require(:crop).permit(:name)
  end

  def find_and_set_crop
    @garden = Garden.find(params[:garden_id])
  end

  end
