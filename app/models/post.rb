class Post < ApplicationRecord
  has_many :users
  has_many :post_tags,                dependent: :destroy
  has_many :tags, through: :post_tag, dependent: :destroy
end
