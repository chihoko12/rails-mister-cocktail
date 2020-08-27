class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      @query = params[:query]
      @cocktails = Cocktail.where("name iLike '%#{params[:query]}%'")
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

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
