require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Love',
      photo: 'https://unsplash.com/photos/4aQMAif1ZKk',
      bio: 'I am a model',
      posts_counter: 4
    )
  end

  before { subject.save }

  it 'valid with valid attributes' do
    subject.name = 'Love'
    expect(subject).to be_valid
  end

  it 'not valid without a name' do
    subject.name = nil
    subject.name = 'Lo'
    expect(subject).to_not be_valid
  end

  it 'returns photo if valid' do
    subject.photo = 'https://unsplash.com/photos/4aQMAif1ZKk'
    expect(subject).to be_valid
  end

  it 'valid with a bio' do
    subject.bio = 'I am a model'
    expect(subject).to be_valid
  end

  it 'returns post counter as an integer' do
    subject.posts_counter = 4
    expect(subject).to be_valid
  end

  it 'not valid if post counter is a string or nil' do
    subject.posts_counter = 5
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
end
