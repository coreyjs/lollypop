require 'mutant'

module UseCases::Recipes
  class RecipeCreatedMutation
    include Mutant

    required_attr :recipe

    def execute(args)
      if recipe.name.blank?
        puts 'whoops this recipe is bad'
      end
    end
  end

end
