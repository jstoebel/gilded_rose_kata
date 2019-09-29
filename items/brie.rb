require 'items/item_wrapper'

class Brie < ItemWrapper
  def update_quality
    if sell_in.positive?
      update_quality_by 1
    else
      update_quality_by 2
    end
    decrease_sell_in
  end
end
