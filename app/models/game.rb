class Game < ApplicationRecord
    has_many :platforms
    has_many :genres
    has_many :reviews
    has_many :users, through: :reviews
end
