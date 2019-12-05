class Post < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :title, :body, :created_at, :updated_at

    # nested objectsとしてuser情報もインデックスに追加する
    attributes :user do
      { name: user.name }
    end
  end

  belongs_to :user
end
