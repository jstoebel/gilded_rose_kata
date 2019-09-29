require 'items/item_wrapper'

class Conjured < ItemWrapper
  def update_quality
    if sell_in.positive?
      degrade_by 2
    else
      degrade_by 4
    end
    decrease_sell_in
  end

  # Degrade item's quality by n
  # Never let quality drop below 0
  def degrade_by(amount)
    new_quality = quality - amount
    self.quality = new_quality
  end
end
