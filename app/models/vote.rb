class Vote < ApplicationRecord
  belongs_to :recipe

  scope :upvotes, -> { where(value: 1) }
  scope :downvotes, -> {where(value: -1)}

  validates :value, numericality: { only_integer: true,
                                    greater_than_or_equal_to: -1,
                                    less_than_or_equal_to: 1}
end

# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint
#  value      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
