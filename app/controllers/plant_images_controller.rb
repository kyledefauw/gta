class PlantImagesController < ApplicationController

  before_action :find_and_set_plant_image

  def index
    @plant_images = @plant.plant_images.all
  end

  def new
    @plant_image = @plant.plant_images.new
  end

  def create
    @plant_image = @plant.plant_images.new(plant_image_params)
    if @plant_image.save
      flash[:notice] = 'Plant images were successfully added'
      redirect_to plant_plant_images_path
    else
      render :new
    end
  end

  def edit
    @plant_image = @plant.plant_images.find(params[:id])
  end

  def show
    @plant_image = @plant.plant_images.find(params[:id])
  end

  def update
    @plant_image = @plant.plant_images.find(params[:id])
    if @plant_image.update(plant_image_params)
      flash[:notice] = 'Plant images were successfully updated!'
      redirect_to plant_plant_images_path
    else
      render :edit
    end
  end

  def destroy
    plant_image = @plant.plant_images.find(params[:id])
    plant_image.destroy
    flash[:error] = "Plant image was deleted"
    redirect_to plant_plant_images_path
  end

  private

  def plant_image_params
    params.require(:plant_image).permit(:image, :plant_id)
  end

  def find_and_set_plant_image
    @plant = Plant.find(params[:plant_id])
  end

end
