class Item < ApplicationRecord

belongs_to :genre, optional: true
validates :name , presence: true
attachment :image

enum is_soldout: {販売中:false, 販売停止:true}

def genre_name
   return genre.name
end

end
