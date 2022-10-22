require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Love',
      bio: 'Professional Model',
      photo: 'http://product.com',z
      posts_counter: 0
    )

    @user2 = User.create(
      name: 'Joe',
      bio: 'Flourist',
      photo: 'http://Joe.com',
      posts_counter: 5
    )

    @post1 = Post.create(
      users: @user1,
      title: 'first photo',
      text: 'This is my first photo',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Its an honour to be here')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Welcome everyone')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'An excelent performance.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Love for all.')
    Comment.create(post_id: @post1.id, user_id: @user2.id, text: 'Just watched YOU')

    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post1.id, user_id: @user2.id)
  end

  describe 'A post with title, comments and counter' do
    it 'displays the post title' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('first photo')
    end

    it 'displays post title and creator' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('first photo by Love')
    end

    it 'displays total comments and likes' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Comments: 5, Likes: 2')
    end

    it 'shows post body' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('This is my first photo')
    end

    it 'shows commentors username and comment' do
      visit user_post_path(@user1, @post1)
      expect(page).to have_content('Love: Its an honour to be here')
      expect(page).to have_content('Love: Welcome everyone')
      expect(page).to have_content('Joe: Love for all.')
    end
  end
end
