class AddConstraintToRecipeRating < ActiveRecord::Migration[6.0]
  def change
    add_index :ratings, [:user_id, :recipe_id], unique: true
  end
end
