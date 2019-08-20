class Game < ApplicationRecord
    has_many :game_platforms
    has_many :platforms, through: :game_platforms
    has_many :genres
    has_many :reviews
    has_many :users, through: :reviews
end
