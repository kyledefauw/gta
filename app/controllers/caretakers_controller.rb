class Caretakers < ApplicationController

  before_action :find_and_set_garden

  def index
    @caretakers = @garden.caretakers
    @garden_name = @garden.name
    @caretaker = @garden.caretakers.new
  end

  def new
    @caretaker = @garden.caretakers.new
  end

  def create
    @caretaker =  @garden.caretakers.new(caretaker_params)

    if @caretaker.save
      flash[:notice] = "Caretaker was successfully created"
      redirect_to garden_caretakers_path(@garden)
    else
      render :index
    end
  end

  def show
    @caretaker = @garden.caretakers.find(params[:id])
  end

  def edit
    @caretaker = @garden.caretakers.find(params[:id])
  end

  def update
    @caretaker = caretaker.find(params[:id])

    if @caretaker.update(caretaker_params)
      flash[:notice] = "Caretaker was successfully updated"
      redirect_to garden_caretakers_path(@garden.id)
    else
      render :index
    end
  end

  def destroy
    caretaker = @garden.caretakers.find(params[:id])
    caretaker.destroy
    redirect_to gardens_path
    flash[:notice] = "Caretaker was successfully removed."
  end

  private

  def caretaker_params
    params.require(:caretaker).permit(:role, :user_id, :garden_id)
  end

end
