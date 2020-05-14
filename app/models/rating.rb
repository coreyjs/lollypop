
class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :value, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
end

# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  recipe_id  :bigint
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
