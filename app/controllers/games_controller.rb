class GamesController < ApplicationController
    before_action :find_game, only: [:show]

    def index
        if params[:genre].blank? && params[:platform].blank?
            @games = Game.all
        elsif params[:platform].blank?
            @games = Genre.find_by(name: params[:genre]).games
        elsif params[:genre].blank? 
            @games = Platform.find_by(name: params[:platform]).games
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
