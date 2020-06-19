class Admins::GenresController < ApplicationController
def index
    @genres = Genre.all
  end

  def new
    @admin = Admin.find(current_customer.id)
    @genre = Genre.new
  end

  def create
  	@genre = Genre.new(name: params[:name], is_deleted: params['is_deleted'])
    @genre.save
    redirect_to admins_genres_path
  end

  def edit
    #@admin = Admin.find(current_customer.id)
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admins_genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admins_genres_path

  end

  private
  def genre_params
  	params.require(:genre).permit(genre_attributes: [:id, :name, :is_deleted])
  end

end
