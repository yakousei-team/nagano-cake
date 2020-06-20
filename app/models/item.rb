class Item < ApplicationRecord

belongs_to :genre, optional: true
validates :name , presence: true
attachment :image

def genre_name
   return genre.name
end

end
