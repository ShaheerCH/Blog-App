class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    users.increment!(:posts_counter)
  end
end
