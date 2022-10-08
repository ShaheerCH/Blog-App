class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :users
  after_save :update_posts_counter

  def return_recent_comments
    comments.order(created_at: :desc).limit(6)
  end

  private

  def update_posts_counter
    users.increment!(:posts_counter)
  end
end
