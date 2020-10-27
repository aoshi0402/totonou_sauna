class Genre < ApplicationRecord
 has_many :sauna_genres
 has_many :saunas, through: :sauna_genres
end
