class Tag < ApplicationRecord

  # Tagsテーブルから中間テーブルへの関連付け
  has_many :post_tags,                  dependent: :destroy

  # Tagsテーブルから中間テーブルを通してPostテーブルへの関連付け
  has_many :posts, through: :post_tags, dependent: :destroy

  validates :name, presence: true, length:{maximum: 10}
end
