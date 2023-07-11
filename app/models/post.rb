class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags,                dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites,                dependent: :destroy
  has_many :post_comments,            dependent: :destroy
  has_many_attached :post_images

  def get_post_image(width, height)
    post_image.variant(resize_to_fill: [width, height]).processed
  end

end
