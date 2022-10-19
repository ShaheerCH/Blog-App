require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.new(
      name: 'Love',
      photo: 'https://unsplash.com/photos/4aQMAif1ZKk',
      bio: 'I am a model',
      posts_counter: 4
    )
  end

  let(:post) do
    Post.new(
      users: user,
      title: 'My first photo',
      text: 'This is my first photograph',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  let(:like) do
    Like.new(
      users: user,
      posts: post
    )
  end

  it 'only valid with a user' do
    like.users = user
    expect(like).to be_valid
  end

  it 'valid with a post' do
    like.posts = post
    expect(like).to be_valid
  end

  it 'updates likes after save' do
    like.save
    expect(post.likes_counter).to eq(3)
  end
end
