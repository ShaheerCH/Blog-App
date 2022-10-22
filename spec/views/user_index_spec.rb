require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Love',
      bio: 'Professional Model',
      photo: 'http://www.vougue.com',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'Joe',
      bio: 'Flourist',
      photo: 'http://you.com',
      posts_counter: 5
    )
  end

  describe 'users index page' do
    it 'shows correct username' do
      visit users_path
      expect(page).to have_content('Love')
      expect(page).to have_content('Joe')
      expect(page).to_not have_content('Jill')
    end

    it 'shows correct photo' do
      visit users_path
      expect(page).to have_css("img[src*='http://www.vougue.com']")
      expect(page).to have_css("img[src*='http://you.com']")
    end

    it 'shows correct Number of posts' do
      visit users_path
      expect(page).to have_content('Number of Posts: 2')
      expect(page).to have_content('Number of Posts: 5')
    end

    it 'shows user_path when clicked' do
      visit users_path
      click_link 'Love'
      expect(page).to have_current_path(user_path(@user))
    end

    it 'renders a bio content in show path' do
      visit users_path
      click_link 'Love'
      expect(page).to have_content('Professional Model')
    end
  end
end
