class Food < ApplicationRecord
  belongs_to :user
  belongs_to :sauna

  attachment :image
end
