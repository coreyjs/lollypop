require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test "a recipe is valid if it has a name" do
    recipe = recipes(:pizza)
    assert recipe.valid?
  end

  test "a recipe is invalid if it does not have a name" do
    recipe = Recipe.new()

    assert_not recipe.valid?
  end

  test "a recipe can have many tags" do
    recipe = recipes(:pizza)
    assert_equal 2, recipe.tags.length
    tag = Tag.new(name: 'Test Tag')
    recipe.tags << tag

    assert_equal 3, recipe.tags.length
  end

  test "recipes can share the same tags" do
    recipe_1 = recipes(:pizza)
    recipe_2 = recipes(:soup)

    tag = tags(:kid_friendly)

    recipe_1.tags << tag
    recipe_2.tags << tag

    assert_includes recipe_1.tags, tag
    assert_includes recipe_2.tags, tag
  end

  test "recipes can add ingredients" do
    recipe = recipes(:taco)
    ingredient = ingredients(:ground_turkey)

    assert recipe.valid?

    recipe.ingredients << ingredient

    recipe.save
    assert_includes recipe.ingredients, ingredient

    # confirm the ingredient is valid when added to the recipe
    assert ingredient.valid?


  end

end
