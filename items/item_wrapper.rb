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

  # update items quality. A positive value for `amount` increases the value
  # and a negative value decreases` it
  def update_quality_by(amount)
    new_quality = quality + amount
    @data.quality = if new_quality.negative?
                      0
                    elsif new_quality > 50
                      50
                    else
                      new_quality
                    end
  end

  def decrease_sell_in
    @data.sell_in -= 1
  end
end
