class LavenderPair < Promotion
  def item_name
    "Lavender heart"
  end

  def pair_price
    17.00
  end

  private

  def applicable?
    pairs > 0
  end

  def pairs_price_before_discount
    pairs * 2 * eligible_items.first.price
  end

  def computed_discount
    pairs_price_before_discount - pairs_price
  end

  def eligible_items
    @eligible_items ||= items.select { |item| item.name == item_name }
  end

  def pairs
    @pairs ||= eligible_items.size / 2
  end

  def pairs_price
    pairs * pair_price
  end
end
