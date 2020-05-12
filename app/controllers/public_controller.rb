class PublicController < ApplicationController
  def main
    @recipes = Recipe.all
  end
end
