class Recipe < ApplicationRecord
  include Filterable
  include RecipeFilter

  has_one :recipe_ranking

  belongs_to :user, optional: true

  has_and_belongs_to_many :tags

  has_many :ingredients#, class_name: 'Ingredient'
  has_many :ratings
  has_many :upvotes, -> { upvotes }, class_name: "Vote"
  has_many :downvotes, -> { downvotes }, class_name: "Vote"

  validates :name, presence: true
  validates :prep_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}
  validates :cook_time, allow_nil: true , :numericality => {greater_than_or_equal_to: 0}

  scope :active, -> { where(active: true, deleted: false, private: false)}
  scope :internal_active, -> { where(deleted: false)}

  # Ranking/Trends
  scope :with_votes, -> { includes(:upvotes, :downvotes)}
  scope :with_rankings, -> {includes(:recipe_ranking)}
  scope :order_by_rank, -> { joins(:recipe_ranking).order('recipe_rankings.rank', 'recipe_rankings.id')}

  delegate :rank, to: :recipe_ranking

  # Is this recipe private to the :user
  def private?
    private
  end

  # Calculates the average value of the recipe's ratings
  # This will also calculate it to the nearest .25
  def rating
    return nil unless ratings.length > 0
    (ratings.average(:value) / 0.25).round * 0.25
  end

  def downvotes_count
    downvotes.size
  end

  def upvotes_count
    upvotes.size
  end

end





# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  user_id      :bigint
#  name         :string
#  slug         :string
#  deleted      :boolean          default(FALSE)
#  active       :boolean          default(TRUE)
#  description  :text
#  photo        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  instructions :text
#  private      :boolean          default(FALSE)
#  prep_time    :integer
#  cook_time    :integer
#
