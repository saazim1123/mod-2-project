class Game < ApplicationRecord
    has_many :game_platforms
    has_many :platforms, through: :game_platforms
    has_many :game_genres
    has_many :genres, through: :game_genres
    has_many :reviews
    has_many :users, through: :reviews
    
    def self.search(search)
        if search
            Game.where("title LIKE ?", "%#{search}%")
        else
            Game.all
        end
    end
end
