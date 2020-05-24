require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @recipe = recipes(:bread)
    sign_in users(:kaladin)
  end

  test 'should get new if authenticated' do
    get new_recipe_rating_url(@recipe)

    assert_response :success
  end

  test 'rating a recipe with 0 ratings sets a rating' do
    assert @recipe.ratings.length, 0
    assert_nil @recipe.rating

    post recipe_ratings_url(@recipe), params: { rating:{ value: 2 } }

    @recipe.reload
    assert @recipe.ratings.length == 1
    assert @recipe.rating, 2
  end

  test 'rating a recipe with a rating changes the rating' do

  end

  test 'cant rate it unauthenticated' do
    sign_out :user

    get new_recipe_rating_url(@recipe)

    assert_response :redirect
  end
end
