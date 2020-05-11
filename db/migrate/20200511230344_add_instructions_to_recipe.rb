class AddInstructionsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :instructions, :text
    add_column :recipes, :private, :boolean, default: false
    add_column :recipes, :prep_time, :integer
    add_column :recipes, :cook_time, :integer
  end
end
