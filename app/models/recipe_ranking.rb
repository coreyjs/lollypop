# This model is wired up to a view called recipe_rankings

class RecipeRanking < ApplicationRecord
  # we need to tell our model what its primary key is,
  # since Rails can’t infer it from the schema.
  self.primary_key = :id

  belongs_to :recipe
end


# == Schema Information
#
# Table name: recipe_rankings
#
#  id        :bigint           primary key
#  recipe_id :bigint
#  score     :bigint
#  rank      :bigint
#
