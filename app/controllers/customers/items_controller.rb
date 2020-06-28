class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.where(is_deleted: false)
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
      @total_number = @items.count
    else
      @items = Item.joins(:genre).where(genres: {is_deleted: false})
      @total_number = @items.count #countメソッドで全商品件数を取得
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_deleted: false)
  end
end
