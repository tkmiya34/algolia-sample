class User < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    # emailなどのセンシティブな情報をインデックスするかは注意が必要
    attributes :name, :birth_date
  end

  has_many :posts
end
