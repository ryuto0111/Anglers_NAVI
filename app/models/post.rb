class Post < ApplicationRecord
  belongs_to :users
  has_many :post_tags,                dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites,                dependent: :destroy
  has_many :post_comments,            dependent: :destroy
  has_many_attached :post_images
end
