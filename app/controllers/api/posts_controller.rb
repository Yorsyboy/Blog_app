class Api::PostsController < ApplicationController
  before_action :authorize!, only: %i[index show], if: :user_signed_in?

  def index
    @posts = Post.all

    if @posts.empty?
      json_response({ message: 'Posts not found' }, 404)
    else
      render json: @posts, status: :ok
    end
  end
end
