class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def new
    @genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    flash[:notice] = "更新完了しました"
    redirect_to admins_genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admins_genres_path

  end

  private
  def genre_params
  	params.require(:genre).permit(:id,:name, :is_deleted)
  end

end
