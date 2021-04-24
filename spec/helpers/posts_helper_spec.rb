require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do

  it 'assigns a user to a post' do
    # arrange
    creator = User.first_or_create!(email: 'raissa@gmail.com', password: 'cicasia', password_confirmation: 'cicasia')
    @post = Post.new(title: 'Title', body: '12345', views: 1)
    
    # act
    returned_post = assign_post_creator(@post, creator)

    # assert
    expect(returned_post.user).to  be(creator)
  end
  
end
