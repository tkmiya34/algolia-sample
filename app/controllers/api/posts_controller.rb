class Api::PostsController < ApplicationController
  protect_from_forgery

  def index
    @posts = Post.all
  end

  def create
    post_params = params.require(:post).permit(:title, :body, :user_id)
    p = Post.create!(post_params)

    # algoliaにインデックス作成
    p.algolia_index!
  end
end
