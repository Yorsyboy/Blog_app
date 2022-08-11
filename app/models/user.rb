class User < ApplicationRecord
  has_many :likes
  has_many :posts
  has_many :comments

  def recent_posts(count: 3)
    Post.where(user_id: id).order(created_at: :desc)[0, count]
  end
end
