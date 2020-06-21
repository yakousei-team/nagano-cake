class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items

#enumの設定
  #支払い方法
  enum payment_method: {銀行振込: 0, クレジットカード: 1}
  #注文ステータス
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4}

end
