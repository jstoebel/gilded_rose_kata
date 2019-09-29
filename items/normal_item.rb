# frozen_string_literal: true

require 'items/item_wrapper'

# represents a normal item
class NormalItem < ItemWrapper
  def update_quality
    if sell_in.positive?
      degrade_by 1
    else
      degrade_by 2
    end
    decrease_sell_in
  end

  private

  # Degrade item's quality by n
  # Never let quality drop below 0
  def degrade_by(amount)
    new_quality = quality - amount
    self.quality = new_quality
  end
end
