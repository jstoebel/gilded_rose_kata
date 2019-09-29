require 'items/item_wrapper'

class Sulfuras < ItemWrapper
  # "Sulfuras", being a legendary item, never has to be sold or
  # decreases in Quality
  def update_quality; end
end
