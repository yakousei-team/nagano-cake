class HomesController < ApplicationController

  def top
  	@genres = Genre.where(is_deleted: false)
  	@item1 = Item.find(3)
  	@item2 = Item.find(4)
  	@item3 = Item.find(5)
  end

end
