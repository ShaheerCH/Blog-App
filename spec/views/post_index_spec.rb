require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Love',
      bio: 'Professional Model',
      photo: 'http://www.vougue.com',
      posts_counter: 0
    )

    @post1 = Post.create(
      users: @user1,
      title: 'First photo',
      text: 'This is my first photograph',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      users: @user1,
      title: 'Second photo',
      text: 'This is my second photograph',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Its an honour to be here')
    Comment.create(post_id: @post1.id, user_id: @user1.id, text: 'Hello everyone, How are you?')
    Comment.create(post_id: @post2.id, user_id: @user1.id, text: 'Long time no see')

    Like.create(post_id: @post1.id, user_id: @user1.id)
    Like.create(post_id: @post2.id, user_id: @user1.id)
  end

  describe 'a post index page' do
    it 'displays username' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Love')
    end

    it 'displays user photo' do
      visit user_posts_path(@user1)
      expect(page).to have_css("img[src*='http://www.vougue.com']")
    end

    it 'displays total posts by user' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Number of Posts: 2')
    end

    it 'show post body' do
      visit user_posts_path(@user1)
      expect(page).to have_content('First photo')
      expect(page).to have_content('Second photo')
      expect(page).to have_content('This is my first photograph')
      expect(page).to have_content('This is my second photograph')
      expect(page).to have_content('add your comments ...')
      expect(page).to have_selector(:link_or_button, 'Like post')
      expect(page).to have_selector(:link_or_button, 'Add comment')
    end

    it 'shows posts likes and comments' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Comments: 2, Likes: 1')
      expect(page).to have_content('Comments: 1, Likes: 1')
    end

    it 'shows comments in a post' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Its an honour to be here')
      expect(page).to have_content('Hello everyone, How are you?')
    end

    it 'redirects when post is clicked' do
      visit user_posts_path(@user1)
      click_link 'First photo'
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end

    it 'redirects when post is clicked' do
      visit user_posts_path(@user1)
      click_link 'Second photo'
      expect(page).to have_current_path(user_post_path(@user1, @post2))
    end

    it 'can add a new post' do
      visit user_posts_path(@user1)
      click_link 'Add new Post'
      expect(page).to have_current_path(new_post_path)
    end
  end
end
