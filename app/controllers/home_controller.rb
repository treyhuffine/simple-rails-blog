class HomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    @posts = Post.all
    if user_signed_in?
      @post  = current_user.posts.build
    else
      anon_user = User.find(1)
      @post  = anon_user.posts.build
    end
  end
end
