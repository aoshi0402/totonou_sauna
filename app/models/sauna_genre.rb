class SaunaGenre < ApplicationRecord
belongs_to :genre
belongs_to :sauna

validates :genre_id, uniqueness: { scope: :sauna_id } 
end
