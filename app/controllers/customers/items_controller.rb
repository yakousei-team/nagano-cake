class Customers::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @items = Item.where(is_soldout: false, genre_id: params[:genre_id])
    else
      @items = Item.all
    end

    @total_number = Item.count #countメソッドで全商品件数を取得
    @genres = Genre.where(is_deleted: false)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end 
