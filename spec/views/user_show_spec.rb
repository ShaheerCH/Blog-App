require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
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
      comments_counter: 1,
      likes_counter: 3
    )

    @post2 = Post.create(
      users: @user1,
      title: 'Second photo',
      text: 'This is my second photograph',
      comments_counter: 2,
      likes_counter: 2
    )
  end

  describe 'a user show page' do
    it 'displays the users profile photo' do
      visit user_path(@user1)
      expect(page).to have_css("img[src*='http://www.vougue.com']")
    end
  end

  it 'displays the user name' do
    visit user_path(@user1)
    expect(page).to have_content('Love')
  end

  it 'displays the user bio' do
    visit user_path(@user1)
    expect(page).to have_content('Professional Model')
  end

  it 'shows Number of posts' do
    visit user_path(@user1)
    expect(page).to have_content('Number of Posts: 2')
  end

  it 'shows all the available users posts' do
    visit user_path(@user1)
    expect(page).to have_content('First photo')
    expect(page).to have_content('Second photo')
  end

  it 'shows a button that helps view all users posts' do
    visit user_path(@user1)
    expect(page).to have_content('see all posts')
  end

  it 'click see all posts, redirects to the users posts index page' do
    visit user_path(@user1)
    click_link 'see all posts'
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  it 'click post to redirect to post show page' do
    visit user_path(@user1)
    click_link 'First photo'
    expect(page).to have_current_path(user_post_path(@user1, @post1))
  end

  it 'click post to redirect to post show page' do
    visit user_path(@user1)
    click_link 'Second photo'
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end
end
