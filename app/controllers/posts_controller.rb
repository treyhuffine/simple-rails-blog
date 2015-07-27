class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    if user_signed_in?
      @post = current_user.posts.build(post_params)
    else
      anon_user = User.find(1)
      @post  = anon_user.posts.build(post_params)
    end

    if @post.save
      redirect_to @post
    end
  end

  def destroy
    @post.destroy
    redirect_to request.referrer || root_url
  end

  protected
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:content)
    end
end
