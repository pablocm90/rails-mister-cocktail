class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@review.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(review_params[:cocktail_id])
  end


  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
