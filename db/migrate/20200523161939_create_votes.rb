class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :recipe, null: true
      t.integer :value, null: false

      t.timestamps
    end
  end
end
