class PetsController < ApplicationController

  def index
    @pets = Pet.all.includes(:user)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pets_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :sex, :profile_image, :age, :type)
  end
end
