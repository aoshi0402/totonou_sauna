class Genre < ApplicationRecord
  has_many :sauna_genres
  has_many :saunas, through: :sauna_genres

  attachment :image

  validates :name, presence: true, length: { maximum: 20 }
end
