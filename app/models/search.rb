class Search < ApplicationRecord
    def search_games
        games = Game.all

        games = Game.where(["title LIKE ?", "%#{keyword}%"]) if keyword.present?
        games = Game.where(["genre LIKE ?", genre]) if genre.present?
        games = Game.where(["platform LIKE ?", platform]) if platform.present?

        return games
    end
end
