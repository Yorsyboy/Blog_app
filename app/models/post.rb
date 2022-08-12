class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true  }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }


  after_save :increment_counter

  private

  def increment_counter
    current_user = User.find(user_id)
    current_user.update(posts_counter: (current_user.posts_counter || 0) + 1)
  end

  def recent_comments(count: 5)
    Comment.where(post_id: id).order(created_at: :desc)[0, count]
  end
end
