class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :tags
  has_many :ingredients#, class_name: 'Ingredient'

  validates :name, presence: true
  validates :prep_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}
  validates :cook_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}

  def private?
    private
  end

end
