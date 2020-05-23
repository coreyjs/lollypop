class Vote < ApplicationRecord
  belongs_to :recipe

  scope :upvotes, -> { where(value: 1) }
  scope :downvotes, -> {where(value: -1)}

  #TODO Add validation for vote value range
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
