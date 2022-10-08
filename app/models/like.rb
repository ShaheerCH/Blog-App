class Like < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
  after_save :update_likes_counter

  private

  def update_likes_counter
    posts.increment!(:likes_counter)
  end
end
