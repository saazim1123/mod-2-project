class GamesController < ApplicationController
    before_action :find_game, only: [:show]

    def index
        if params[:genre].blank?
            @games = Game.all
        else
            @genre_id = Genre.find_by(name: params[:genre])
            @games = Game.all.select{|g| g.genres[0].name == @genre_id.name}
        end
    end

    def show
        
    end

    private
        def game_params
            params.require(:game).permit(:title, :genre_id)
        end

        def find_game
            @game = Game.find(params[:id])
        end


        
end
