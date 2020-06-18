class Customers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_soldout: false) #whereメソッドで販売中のみの商品に範囲を設定
    @total_number = Item.count #countメソッドで全商品件数を取得
    @genres = Genre.where(is_deleted: false) #ジャンルのステータスが有効のみ範囲を設定
  end

  def show
    @item = Item.find(params[:id])
    @curt_item = CartItem.new
    @ganres = Genre.where(is_deleted: false)
  end
end
