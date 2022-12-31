class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to :index
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to edit_admin_genre_path(list.id)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
