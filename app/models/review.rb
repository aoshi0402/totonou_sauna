class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sauna

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # すでにいいねしているかを確認
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
