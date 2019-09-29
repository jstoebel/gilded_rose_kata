require 'items/item_wrapper'

class BackstagePass < ItemWrapper
  def update_quality
    if sell_in <= 0
      @data.quality = 0
    elsif sell_in <= 5
      update_quality_by(3)
    elsif sell_in <= 10
      update_quality_by(2)
    else
      update_quality_by(1)
    end
    decrease_sell_in
  end
end
