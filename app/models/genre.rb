class Genre < ApplicationRecord
    has_many :game_genre
    has_many :games, through: :game_genre

    def self.unique_genres
        Genre.all.uniq{|genre| genre.name}
    end
end