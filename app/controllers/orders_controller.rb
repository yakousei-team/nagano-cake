class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer, only: [:show]

  def new
    if current_customer.cart_items.blank? #カートの中身が無い場合
      redirect_to cart_items_path, notice: "カートに商品を入れてください。"
    end
    @order = Order.new
    @address = current_customer.postcode.to_s + current_customer.address.to_s
  end

  def create
    @order = Order.new(session[:order]) #session[:order]の値を代入

    #請求金額入力用
    total = 0
    cart_items = current_customer.cart_items #自身のカート情報を取得し代入
    cart_items.each do |cart_item| #カートの商品毎の小計を1つずつ取り出し合算
      total += ((cart_item.item.unit_price * 1.1).floor * cart_item.quantity)
    end #ループ終了
    @order.total_price = total + 800 #配送料を含める
    @order.save #注文を保存

    #OrderItem作成
    cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id #商品idを注文商品idに代入
      @order_item.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
      @order_item.price = (cart_item.item.unit_price * 1.1).floor #税込み金額代入
      @order_item.order_id = @order.id #注文商品に注文idを紐付け
      @order_item.save #注文商品を保存
    end #ループ終了

    current_customer.cart_items.destroy_all #カートの中身を空にする
    redirect_to thanks_path
  end

  def infomation
    @cart_items = CartItem.where(customer_id: current_customer.id) #自身のカートの中身の情報取得
    @total = 0
    session[:order] = Order.new() #sessionデータ用
    session[:order][:customer_id] = current_customer.id #session[:order]の[:customer_id]に値を取得
    session[:order][:payment_method] = params[:order][:payment_method] #session[:order]の[:payment_method]に値を取得

    if params[:example] == "1" #ご自身の住所を選択した場合
      session[:order][:postcode] = current_customer.postcode #自身の郵便番号を取得
      session[:order][:address] = current_customer.address #自身の郵便番号を取得
      session[:order][:name] = current_customer.last_name + current_customer.first_name #自身の宛名を取得
    elsif params[:example] == "2" #登録済からを選択した場合
      delivery = Delivery.find(params[:order][:delivery_id]) #newページで選択された登録済住所の情報を取得
      session[:order][:postcode] = delivery.postcode
      session[:order][:address] = delivery.address
      session[:order][:name] = delivery.name
    elsif params[:example] == "3" #新しいお届け先を選択した場合
      session[:order][:postcode] = params[:order][:postcode]
      session[:order][:address] = params[:order][:address]
      session[:order][:name] = params[:order][:name]
    else
      redirect_to new_order_path
    end
  end

  def thanks
    session[:order].clear #sessionデータを削除(解放)する
  end

  def index #注文履歴一覧画面
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show #注文履歴詳細画面
    @order = Order.find(params[:id])
    @order_item = @order.order_items
    @total = 0
  end

  private

  def order_params
      params.require(:order).permit(:customer_id, :payment_method, :example, :delivery_id, :address, :postcode, :name, :total_price)
  end

  def correct_customer
    @order = Order.find(params[:id])
    if current_customer.id != @order.customer_id
      redirect_to order_path
    end
  end

end

