require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.new(
      name: 'John',
      photo: 'https://unsplash.com/photos/4aQMAif1ZKk',
      bio: 'I am a model',
      posts_counter: 4
    )
  end

  let(:post) do
    Post.new(
      users: user,
      title: 'My first photoshoot',
      text: 'This is my first photoshoot',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  it 'not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'not valid without a text' do
    post.text = 'This is my first photoshoot'
    expect(post).to be_valid
  end

  it 'only valid with a user' do
    post.users = user
    expect(post).to be_valid
  end

  it 'not valid without a user' do
    post.users = nil
    expect(post).to_not be_valid
  end

  it 'not valid if comment counter is less than 0' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'valid if likes counter is 2' do
    post.likes_counter = 2
    expect(post).to be_valid
  end

  it 'updates posts counter after save' do
    post.save
    expect(user.posts_counter).to eq(5)
  end
end
