# Wrapper for the item struct
# All items have a SellIn value which denotes the number of days we have to sell
# the item
# All items have a Quality value which denotes how valuable the item is
# At the end of each day our system lowers both values for every item
class ItemWrapper
  def initialize(data)
    @data = data
  end

  # delegator methods to get quality and sell_in from wrapped object
  def quality
    @data.quality
  end

  def sell_in
    @data.sell_in
  end

  private

  # set wrapped data's quality
  # disalow vlaues > 50 and < 0
  def quality=(amount)
    new_amount = if amount.negative?
                   0
                 elsif amount > 50
                   50
                 else
                   amount
                 end
    @data.quality = new_amount
  end

  def decrease_sell_in
    @data.sell_in -= 1
  end
end
