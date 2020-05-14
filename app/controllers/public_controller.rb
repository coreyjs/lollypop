class PublicController < ApplicationController
  def main
    @recipes = Recipe.active.limit(9).shuffle
  end
end
