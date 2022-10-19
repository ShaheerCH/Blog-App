require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user =
      User.create(
        name: 'Love',
        photo: 'https://unsplash.com/photos/4aQMAif1ZKk',
        bio: 'I am a model',
        posts_counter: 4
      )

    @post =
      Post.create(
        users: @user,
        title: 'My first photo',
        text: 'This is my first photograph',
        comments_counter: 1,
        likes_counter: 2
      )
  end

  context 'GET #index for a user post' do
    before(:each) { get user_posts_path(@user) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    before(:each) { get user_post_path(@user, @post) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders show template' do
      expect(response).to render_template('show')
    end
  end
end
