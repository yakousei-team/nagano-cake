class Item < ApplicationRecord
belongs_to :genre, optional: true
validates :name , presence: true
attachment :image

def genre_name
	self.genre.name
end

end
