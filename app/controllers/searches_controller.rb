class SearchesController < ApplicationController
    
        def new
            @search = Search.new
            # @platforms = Game.all.uniq.pluck(:platform)
        end
    
        def create
            @search = Search.create(search_params)
            redirect_to @search
        end
    
        def show
            @search = Search.find(params[:id])
        end
    
        private
    
        def search_params
            params.require(:search).permit(:keywords, :genre_id, :platform_id)
        end

end
