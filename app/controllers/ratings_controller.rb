class RatingsController < ApplicationController
  before_action :authenticate_user!

  # GET /recipe/:id/ratings/new
  def new
    @recipe = Recipe.active.find(params[:recipe_id])
    @rating = Rating.new
  end


  # POST /recipe/1/ratings
  def create
    @rating = Rating.new(ratings_params)
    @rating.recipe = Recipe.active.find(params[:recipe_id])
    @rating.user = current_user

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating.recipe, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ratings_params
    params.require(:rating).permit(:value)
  end
end
