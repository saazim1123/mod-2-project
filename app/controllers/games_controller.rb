class GamesController < ApplicationController
    before_action :find_game, only: [:show, :edit, :update, :destroy]
    def index
        if params[:category].blank?
            @games = Game.all
        else
            @category_id = Category.find_by(genre: params[:category]).id
            @games = Game.where(:category_id => @category_id).order("created_at ASC")
        end
    end

    def show
        
    end

    def new
        @game = current_user.games.build
        @categories = Category.all.map { |category| [category.genre, category.id]}
    end

    def create
        @game = current_user.games.build(game_params)
        
        if @game.save
            redirect_to games_path
        else
            render :new

        end

    end

    def edit
        @categories = Category.all.map { |category| [category.genre, category.id]}
    end

    def update
        if @game.update(game_params)
            redirect_to game_path(@game)
        else
            render :edit
        end
    end

    def destroy
        @game.destroy
        redirect_to games_path
    end

    private
        def game_params
            params.require(:game).permit(:title, :description, :publisher, :category_id, :game_image)
        end

        def find_game
            @game = Game.find(params[:id])
        end


        
end
