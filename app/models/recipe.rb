class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags
  has_many :ingredients#, class_name: 'Ingredient'
  has_many :ratings

  validates :name, presence: true
  validates :prep_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}
  validates :cook_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}

  scope :active, -> { where(active: true, deleted: false)}

  # Is this recipe private to the :user
  def private?
    private
  end

  # Calculates the average value of the recipe's ratings
  # This will also calculate it to the nearest .25
  def rating
    return 0 unless ratings.length > 0
    (ratings.average(:value) / 0.25).round * 0.25
  end

end
