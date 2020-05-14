class RatingsController < ApplicationController
  before_action :authenticate_user!

  # POST /recipe/1/ratings
  def create

  end

  private

  def ratings_params
    params.require(:rating).permit(:value, :recipe_id)
  end
end
