class Customers::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @items = Item.where(is_soldout: false, genre_id: params[:genre_id])
      @total_number = @items.count
    else
      @items = Item.where(is_soldout: false)
      @total_number = @items.count #countメソッドで全商品件数を取得
    end

    @genres = Genre.where(is_deleted: false)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end 
