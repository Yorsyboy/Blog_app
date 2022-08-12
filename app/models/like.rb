class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :increment_counter

  def increment_counter
    post.update(likes_counter: (post.likes_counter || 0) + 1)
  end
end
