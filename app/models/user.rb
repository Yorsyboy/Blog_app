class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable

  has_many :likes
  has_many :posts
  has_many :comments

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts(count: 3)
    posts.order(created_at: :desc)[0, count]
  end
end
