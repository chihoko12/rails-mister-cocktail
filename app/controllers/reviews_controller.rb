class ReviewsController < ApplicationController
  before_action :set_cocktail, only: :create

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
