class HomesController < ApplicationController
  def top
  	@genres = Genre.where(is_deleted: false)
  	@item1 = Item.find(1)
  	@item2 = Item.find(1)
  	@item3 = Item.find(1)
  end

end