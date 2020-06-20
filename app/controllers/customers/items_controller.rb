class Customers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_soldout: false) #whereメソッドで販売中のみの商品に範囲を設定
    @total_number = Item.count #countメソッドで全商品件数を取得
    @genres = Genre.all #ジャンルのステータスが有効のみ範囲を設定
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end
