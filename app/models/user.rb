class User < ApplicationRecord
  has_many :likes
  has_many :posts
  has_many :comments

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts(count: 3)
    Post.where(user_id: id).order(created_at: :desc)[0, count]
  end
end
