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
end
