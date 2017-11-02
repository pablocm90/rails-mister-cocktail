class DosesController < ApplicationController
  before_action :set_dose, only: [ :destroy ]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(dose_params[:ingredient].to_i)

    params[:id] = params[:cocktail_id]
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end


  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

    # params.require(:restaurant).permit(:name, :address, :description, :stars)
end
