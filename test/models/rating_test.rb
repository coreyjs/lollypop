require 'test_helper'

class RatingTest < ActiveSupport::TestCase

  test "it should be valid with a rating > 0 and <= 5" do
    rating = ratings(:rating_one)
    assert rating.valid?, rating.errors.full_messages.inspect
  end

  test "it should be invalid if it has a rating > 5" do
    rating = Rating.new(value: 4)
    rating.user = users(:kaladin)
    rating.recipe = recipes(:pizza)

    assert rating.valid?
    rating.value = 6
    assert_not rating.valid?
  end

  test "it should be invalid if it has a rating <= 0" do
    rating = Rating.new(value: 4)
    rating.user = users(:kaladin)
    rating.recipe = recipes(:pizza)

    assert rating.valid?
    rating.value = 0
    assert_not rating.valid?
  end
end
