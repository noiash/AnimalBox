class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end


  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pets_path
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet.id)

  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to user_path(current_user)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :sex, :profile_image, :age, :type, :user_id)
  end
end
