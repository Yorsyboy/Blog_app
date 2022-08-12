require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Toyosi', photo: 'https://unsplash.com/photos/G1N9kDHqBrQ',
                        posts_counter: 0, bio: 'Software Engineer')
  end

  it 'should return posts_counter greater than or equal to 0' do
    @user.posts_counter = -9
    expect(@user).to_not be_valid

    @user.posts_counter = 0
    expect(@user).to be_valid

    @user.posts_counter = 18
    expect(@user).to be_valid
  end

  it 'should have name not equal to nil' do
    @user.name = 'Toyosi'
    expect(@user).to be_valid

    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should have post counter numericaly' do
    @user.posts_counter = 'one'
    expect(@user).to_not be_valid
  end
  it 'should return less than 5 posts ' do
    value = @user.recent_posts.length
    expect(value).to be < 5
  end

  it 'should have name not empty' do
    @user.name = ''
    expect(@user).to_not be_valid
  end
end
