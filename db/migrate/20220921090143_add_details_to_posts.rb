class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :string
    add_column :posts, :comments_counter, :integer
    add_column :posts, :likes_counter, :integer
  end
end
