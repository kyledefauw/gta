class PlantImagesController < ApplicationController

  def index
    @plant_images = PlantImages.all
  end

  def new
    @plant_image = PlantImage.new
  end

  def create
    @plant_image = PlantImage.new(plant_image_params)
    if @plant_image.save
      flash[:notice] = 'Plant image was successfully added'
      redirect_to plant_entry_plant_images_path
    else
      render :new
    end
  end

  def edit
    @plant_image = PlantImage.find(params[:id])
  end

  def show
    @plant_image = PlantImage.find(params[:id])
    @plant_images = PlantImage.all
    @crop = Crop.find(params[:id])
  end

  def update
    @plant_image = PlantImage.find(params[:id])
    if @plant_image.update(plant_image_params)
      flash[:notice] = 'Plant image were successfully updated!'
      redirect_to plant_entry_plant_images_path
    else
      render :edit
    end
  end

  def destroy
    plant_image = PlantImage.find(params[:id])
    plant_image.destroy
    flash[:error] = "Plant image was deleted"
    redirect_to plant_entry_plant_images_path
  end

  private

  def plant_image_params
    params.require(:plant_image).permit(:plant_picture, :plant_entry_id)
  end

end
