class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags
  has_many :ingredients, class_name: 'Ingredient'

  validates :name, presence: true
end
