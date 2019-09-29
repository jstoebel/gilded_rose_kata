require 'items/item_wrapper'

class BackstagePass < ItemWrapper
  def update_quality
    if sell_in <= 0
      self.quality = 0
    elsif sell_in <= 5
      improve_by(3)
    elsif sell_in <= 10
      improve_by(2)
    else
      improve_by(1)
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
