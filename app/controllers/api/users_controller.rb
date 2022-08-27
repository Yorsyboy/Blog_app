class Api::UsersController < ApplicationController
  before_action :authorize!, only: %i[index show], if: :user_signed_in?

  def index
    json_response({ message: 'Welcome' }, 404)
  end

  def show
    json_response({ message: 'to see the posts' }, 404)
  end
end
