class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :user
      t.string :name, required: true
      t.string :slug, unique: true
      t.boolean :deleted, default: false
      t.boolean :active, default: true
      t.text :description
      t.string :photo
      t.timestamps
    end
  end
end
