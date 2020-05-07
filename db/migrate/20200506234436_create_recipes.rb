class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user
      t.string :name
      t.string :slug
      t.boolean :deleted
      t.boolean :active
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
