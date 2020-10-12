# frozen_string_literal: true

class Checkout
  attr_reader :rules, :items

  def initialize(rules)
    @rules = rules
    @items = []
  end

  def scan(item)
    items << item
    @total = nil
  end

  def total
    @total ||= rules.inject(price_before_discounts) do |total, rule|
      total - rule.new(total, *items).amount
    end.round(2)
  end

  private

  def price_before_discounts
    items.sum(&:price)
  end
end
