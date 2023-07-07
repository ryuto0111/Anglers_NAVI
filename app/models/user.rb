class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entries,       dependent: :destroy
  has_many :messages,      dependent: :destroy
  has_many :posts,         dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites,     dependent: :destroy
  has_many :relationships,            class_name: "Relationships", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_re_relationships, class_name: "Relationships", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships,            source: :followed
  has_many :followers,  through: :reverse_of_relationships, source: :follower
end
