class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :posts
  after_save :update_comments_counter

  private

  def update_comments_counter
    posts.increment!(:comments_counter)
  end
end
