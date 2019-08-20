class Genre < ApplicationRecord
    belongs_to :game

    def self.unique_genres
        Genre.all.uniq{|genre| genre.name}
    end
end