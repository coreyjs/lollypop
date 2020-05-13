class PublicController < ApplicationController
  def main
    @recipes = Recipe.active
  end
end
