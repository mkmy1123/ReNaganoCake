class Admin::GenresController < ApplicationController
before_action :authenticate_admin!

    def create
      @genre = Genre.new(genre_params)
      @genres = Genre.all
      if @genre.save
      redirect_to admin_genres_path
      else
        render 'index'
      end
    end

    def index
      @genre = Genre.new
      @genres = Genre.all
    end

    def edit
      @genre = find_genre_by_id
    end

    def update
      @genre = find_genre_by_id
      if @genre.update(genre_params)
        redirect_to admin_genres_path
      else
        render 'edit'
      end
    end

    private
    def genre_params
    	params.require(:genre).permit(:name, :is_valid)
    end
    def find_genre_by_id
        Genre.find(params[:id])
    end
end
