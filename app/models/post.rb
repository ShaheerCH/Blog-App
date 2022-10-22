class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  after_save :update_posts_counter

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :text, presence: true, length: { minimum: 3, maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    users.increment!(:posts_counter)
  end
end
