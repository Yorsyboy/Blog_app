class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @all_posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    @user = current_user
    post = Post.new(post_params)
    post.user_id = @user.id
    post.comments_counter = 0
    post.likes_counter = 0
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post created!'
          redirect_to user_posts_path(@user)
        else
          flash.now[:error] = 'Post not created!'
          render :new, locals: { post: }
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
