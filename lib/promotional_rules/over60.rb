# frozen_string_literal: true

class Over60 < Promotion
  DISCOUNT    = 0.10
  PRICE_LIMIT = 60

  private

  def applicable?
    price_before_discount > PRICE_LIMIT
  end

  def computed_discount
    price_before_discount * DISCOUNT
  end
end
