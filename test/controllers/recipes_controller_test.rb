require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @recipe = recipes(:pizza)
    sign_in users(:kaladin)
  end

  test "should get index" do
    sign_out :user
    get recipes_url
    assert_response :success
  end

  test "should get new if authenticated" do
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe if authenticated" do
    sign_in users(:kaladin)

    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { active: @recipe.active, deleted: @recipe.deleted,
                                            description: @recipe.description,
                                            name: @recipe.name, slug: 'test', prep_time:10, cook_time: 15 } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    sign_out :user
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get redirected if not logged in on edit" do
    sign_out :user
    get edit_recipe_url(@recipe)
    assert_response :redirect
  end

  test "should get edit if authenticated" do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "should update recipe if authenticated" do
    patch recipe_url(@recipe), params: { recipe: { active: false, deleted: @recipe.deleted, description: @recipe.description, name: @recipe.name, slug: @recipe.slug } }
    assert_redirected_to recipe_url(@recipe)
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
   end

  test "cant edit someone elses recipe" do

  end

  test "a recipe has a NULL rating without a rating" do

  end

  test "decimals should be rouned to the quarter star when multiple ratings exist" do

  end
end
