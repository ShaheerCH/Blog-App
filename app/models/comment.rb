class Comment < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
  after_save :update_comments_counter

  private

  def update_comments_counter
    posts.increment!(:comments_counter)
  end
end
