class Admins::OrdersController < ApplicationController

  def index
  	@orders = Order.all
  end
  	
  def show
  	@order = Order.find(params[:id])
  end
  
  def edit
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id]) #注文詳細の情報を取得
    @order_items = @order.order_items #注文に紐付く注文商品を全て取得
    @order.update(order_params) #注文ステータスの更新

    if @order.order_status == "入金確認" #注文ステータスが入金確認の場合
      @order_items.update_all(production_status: 1) #注文に紐付く注文商品の全ての製作ステータスを「製作待ち」に更新
    end

    flash[:notice] = "更新完了しました"
    redirect_to admins_order_path(@order)
  end

  def production_status_update
    @order_item = OrderItem.find(params[:id]) #注文商品の情報を取得
    @order = @order_item.order #注文商品に紐付く注文テーブルを取得
    @order_item.update(order_item_params) #注文商品のステータスを更新

    if @order.order_items.count == @order.order_items.where(production_status: "制作完了").count #全ての注文商品の製作ステータスが「制作完了」になった場合
      @order.update(order_status: 3) #注文ステータスを「発送準備中」に更新
    end

    flash[:notice] = "更新完了しました"
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
  	params.require(:order).permit(:order_status)
  end

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end


end
