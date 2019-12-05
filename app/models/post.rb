class Post < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :title, :body
    attributes :user do
      { name: user.name }
    end
  end

  belongs_to :user
end
