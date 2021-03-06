# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint
#  quantity   :integer          not null
#  fraction   :float
#  uom        :integer
#  name       :string           not null
#  slug       :string
#  ordinal    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

  test 'an ingredient is valid if it has a name and quantity >0' do
    ingredient = ingredients(:pepperoni)

    assert ingredient.valid?
  end

  test 'an ingredient is invalid if it has no name' do
    ingredient = Ingredient.new()

    assert_not ingredient.valid?
  end

  test 'an ingredient cant have < 0 quantity and be valid' do
    ingredient = Ingredient.new(name: 'test', quantity: -1, fraction: 0.5)

    assert_not ingredient.valid?
  end

  test 'fixture is correct' do
    ingredient = ingredients(:pepperoni)
    assert ingredient.valid?
  end

end
