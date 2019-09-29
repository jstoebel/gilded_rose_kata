require 'items/item_wrapper'

class Conjured < ItemWrapper
  def update_quality
    if sell_in.positive?
      update_quality_by(-2)
    else
      update_quality_by(-4)
    end
    decrease_sell_in
  end
end
