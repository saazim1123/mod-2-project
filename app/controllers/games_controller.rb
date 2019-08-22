class GamesController < ApplicationController
before_action :find_game, only: [:show]

    def welcome
    end
    
    def index
        if params[:genre].blank? && params[:platform].blank?
            @games = Game.all
            @games = Game.search(params[:search])
        elsif params[:platform].blank?
            @games = Genre.find_by(name: params[:genre]).games
        elsif params[:genre].blank? 
            @games = Platform.find_by(name: params[:platform]).games
        end  
    end

    def most_played
    end

    def show
        if @game.reviews.blank?
            @average_review = "No Reviews have been added to this game"
        else
            @average_review = @game.reviews.average(:rating).round(2)
        end
    end

    private

    def game_params
        params.require(:game).permit(:title, :genre_id)
    end

    def find_game
        @game = Game.find(params[:id])
    end
end
