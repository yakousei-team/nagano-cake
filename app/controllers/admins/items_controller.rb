class Admins::ItemsController < ApplicationController
before_action :set_genres

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(@item.genre_id)
    @genre_name = @genre.name
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to request.referer
  end

  def edit
  end

  def update
  end

private
  def item_params
    params.require(:item).permit(:name, :description, :genre_id, :unit_price, :is_soldout, :image)
  end

  def set_genres
    @genres = Genre.all
  end

end
