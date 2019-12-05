class Api::UsersController < ApplicationController
  protect_from_forgery

  def index
    @users = User.all
  end

  def create
    user_params = params.require(:user).permit(:name,:email,:birth_date)
    u = User.create!(user_params)

    # algoliaにインデックス作成
    u.algolia_index!
  end
end
