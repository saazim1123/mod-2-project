class Search < ApplicationRecord
   
    def games
        @games ||= find_games
    end

private 

    def find_games
        games = Game.order(:name)
        games = games.where("title LIKE ?", "%#{keyword}%") if keyword.present?
        games = games.where(genre_id: genre_id) if genre_id.present?
        games = games.where(platform_id: platform_id) if platform_id.present?
        return games
    end
end


