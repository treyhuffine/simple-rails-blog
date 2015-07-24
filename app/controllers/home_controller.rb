class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
    @post  = current_user.posts.build
  end
end
