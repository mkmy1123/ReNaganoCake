class Admin::GenresController < ApplicationController
    def create
      @genre = Genre.new(genre_params)
      @genre.save
    end

    def index
      @genre = Genre.new
      @genres = Genre.all
    end

    def edit
    end

    def update
    end

    private
    def genre_params
    	params.require(:genre).permit(:name, :is_valid)
    end
end
