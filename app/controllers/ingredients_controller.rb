class IngredientsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new
  end

  def create
    @cocktail = Cocktail.find(params[:ingredient][:cocktail_id])
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
