class Ingredient < ApplicationRecord
  belongs_to :recipe
  enum uom: [
      :teaspoon, # 0
      :tablespoon, # 1
      :cup, # 2
      :gallon, # 3
      :quart, # 4
      :pint, # 5
      :dessertspoon, # 6
      :fluid_ounce, # 7
      :gram, #8
      :smidgen, # 9
      :pinch, # 10
      :drop, # 11
      :dash, #12
      :pound #13
  ], _suffix: true

  validates :name, presence: true
  validates :quantity, presence: true,
            :numericality => {greater_than_or_equal_to: 0}
end
