class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  validates :name, presence: true, length:{ minimum: 2, maximum: 10 }, uniqueness: true
end
