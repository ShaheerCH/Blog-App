class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :bio, presence: true, length: { minimum: 3, maximum: 150 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
