class Item < ApplicationRecord
  belongs_to: genre
  has_many: cart_items
  has_many: order_items

  attachment :image

  enum is_soldout: {販売中:false, 販売停止:true}
end
