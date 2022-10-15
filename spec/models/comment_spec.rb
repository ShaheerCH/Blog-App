require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
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
      title: 'My first shoot',
      text: 'This is my first photoshoot',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  let(:comment) do
    Comment.new(
      users: user,
      posts: post,
      text: 'Hey!, it is my first photoshoot'
    )
  end

  it 'not valid without text' do
    comment.text = 'Hey!, it is my first photoshoot'
    expect(comment).to be_valid
  end

  it 'valid with a user' do
    comment.users = user
    expect(comment).to be_valid
  end

  it 'valid with a post' do
    comment.posts = post
    expect(comment).to be_valid
  end

  it 'updates counter after save' do
    comment.save
    expect(post.comments_counter).to eq(2)
  end
end
