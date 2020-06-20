class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: [:create]

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.where(item_id: @cart_item.item_id).exists? #カートの中に同じ商品があるか確認する
      @cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id) #fand_byメソッドを使いすでにあるカート商品を取得
      @cart_item.update(quantity: @cart_item.quantity + params[:cart_item][:quantity].to_i) # 現在の数量　＋　送られてきた数量
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all #destroy_allメソッドで全てのカート内商品を消去する
    redirect_to request.referer
  end

  private

  def setup_cart_item!
    #送られてきたパラメータのquantityが空の場合はメッセージを表示しリダイレクトする
    redirect_to item_path(params[:cart_item][:item_id]), notice: "個数を入力してください。" if params[:cart_item][:quantity].empty?
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity,:customer_id)
  end

end
