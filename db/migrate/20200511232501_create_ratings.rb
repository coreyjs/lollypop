class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: true
      t.references :recipe, null: true
      t.integer :value

      t.timestamps
    end
  end
end
