class Sauna < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ikitais, dependent: :destroy

  # 「イキタイ」が既に押してあるかの確認
  def iktaied_by?(user)
    ikitais.where(user_id: user.id).exists?
  end
end