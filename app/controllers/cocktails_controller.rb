class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :destroy]

  def home
  end

  def index
    if params[:name].present?
      @query = params[:name]
      @cocktails = Cocktail.where("name iLike '%#{@query}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
    @ingredient = Ingredient.new
    @review = Review.new
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
