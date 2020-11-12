class Food < ApplicationRecord
  belongs_to :user
  belongs_to :sauna

  attachment :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 100 }
  validates :image, presence: true

end
