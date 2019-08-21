class Search < ApplicationRecord
   

    def find_games
        games = Game.order(:name)
        games = games.where("title like ?", "%#{keyword}%") if keyword.present?
        games = games.where(genre_id: genre_id) if genre_id.present?
        games = games.where(platform_id: platform_id) if platform_id.present?
        games
    end
end
