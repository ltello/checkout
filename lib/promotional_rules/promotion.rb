class Promotion
  attr_reader :items, :price_before_discount

  def initialize(price_before_discount, *items)
    @price_before_discount = price_before_discount
    @items                 = items
  end

  def amount
    applicable? ? computed_discount : 0
  end

  private

  def applicable?
    raise "Overide this method in your subclass"
  end

  def computed_discount
    raise "Overide this method in your subclass"
  end

  def item_names
    items.map(&:name)
  end
end
