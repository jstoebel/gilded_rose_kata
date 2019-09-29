require 'items/item_wrapper'

class Brie < ItemWrapper
  def update_quality
    if sell_in.positive?
      improve_by 1
    else
      improve_by 2
    end
    decrease_sell_in
  end

  private

  # Degrade item's quality by n
  # Never let quality drop below 0
  def improve_by(amount)
    new_quality = quality + amount
    self.quality = new_quality
  end
end
