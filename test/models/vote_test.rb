# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint
#  value      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test 'a vote cant have a number > 1' do
    recipe = recipes(:pizza)
    vote = Vote.new(recipe: recipe, value: 2)
    assert_not vote.valid?
  end
end
