class GamesController < ApplicationController
    before_action :find_game, only: [:show]

    def index
        if params[:genre].blank?
            @games = Game.all
        else
            @genre_id = Genre.find_by(name: params[:genre])
            @games = Game.where(id: @genre_id.game_id)
        end
    end

    def show
        
    end

    def new
        @game = current_user.games.build
        @genres = Genre.all
    end

    private
        def game_params
            params.require(:game).permit(:title, :genre_id)
        end

        def find_game
            @game = Game.find(params[:id])
        end


        
end
