class ReviewsController < ApplicationController
    before_action :find_game
    before_action :find_review, only: [:edit, :update, :destroy]

    def new
        @review = Review.new
        if current_user 
            @review = Review.where(user_id: current_user.id, game_id: params[:game_id]).first_or_initialize 
            if @review.id.present? 
              render 'edit' 
            end 
        end 
        
    end

    def show
    end


    def create
        @review = Review.new(review_params)
        @review.game_id = @game.id
        @review.user_id = current_user.id
        if @review.save
            redirect_to game_path(@game)
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        if @review.update(review_params)
            redirect_to game_path(@game)
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to game_path(@game)
    end
        
    

    private

    def review_params
        params.require(:review).permit(:rating, :content)
    end

    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end
end
