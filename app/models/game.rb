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

    def self.most_played
        all.max_by(3){|game| game.reviews.count}
    end

    def self.top_rated
        all_with_reviews.max_by(10){|game| game.reviews.average(:rating)}
    end

    def self.all_with_reviews
        all.select{|game| game.reviews.length > 0}
    end
end
