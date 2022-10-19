require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user =
      User.create(
        name: 'Love',
        photo: 'https://unsplash.com/photos/4aQMAif1ZKk',
        bio: 'I am a model',
        posts_counter: 4
      )
  end

  context 'GET #index' do
    before(:each) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'does not render a different template' do
      expect(response).to_not render_template(:show)
    end
  end

  context 'GET #show' do
    before(:each) { get user_path(@user) } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
