require 'rails_helper'

RSpec.describe Post, type: :model do

  current_user = User.first_or_create!(email: 'raissa@gmail.com', password: 'cicasia', password_confirmation: 'cicasia')

  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'Teste1 body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = 'has a title'
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'Title test',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = 'has a body'
    expect(post).to be_valid
  
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: '',
      body: 'Body Teste',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = '12'
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: 'Title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    
    post.body = '12345'
    expect(post).to be_valid

    hundred_cha_string = 'HLF7NuXIFl9bwEvAXsrCDPhaOhGnw161JTMTupYG6pkiuT2lkYeqEk1qWBQhB3jCNcenuhtlu7OoIdhBPlEureWWiRotOu6yXLkk'
    post.body = hundred_cha_string
    expect(post).to be_valid

    hundred_cha_string = hundred_cha_string + '1'
    post.body = hundred_cha_string
    expect(post).to_not be_valid
  end

  it 'has numeracal views' do
    post = Post.new(
      title: 'Title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = '12345'
    expect(post).to be_valid
  end

end