Dir['items/*.rb'].each { |file| require file }

class ItemBuilder
  def self.build(item)
    case item.name
    when 'NORMAL ITEM'                               then NormalItem.new(item)
    when 'Aged Brie'                                 then Brie.new(item)
    when 'Sulfuras, Hand of Ragnaros'                then Sulfuras.new(item)
    when 'Backstage passes to a TAFKAL80ETC concert' then BackstagePass.new(item)
    when 'Conjured Mana Cake'                        then Conjured.new(item)
    end
  end
end
