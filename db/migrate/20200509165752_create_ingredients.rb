class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.belongs_to :recipe
      t.integer :quantity, null: false
      t.float :fraction, null: true
      t.integer :uom, null: true
      t.string :name, null: false
      t.string :slug, null: true
      t.integer :ordinal, default: 0

      t.timestamps
    end
  end
end
