# frozen_string_literal: true

describe "When no discount rules are in place" do
  let(:checkout) { Checkout.new(promotional_rules) }
  let(:items) {
    [
      Item.new(name: "Lavender heart",         price: 9.25),
      Item.new(name: "Personalised cufflinks", price: 45.00),
      Item.new(name: "Kids T-shirt",           price: 19.95)
    ]
  }
  let(:promotional_rules) { [] }

  before do
    items.each { |item| checkout.scan(item) }
  end

  it "apply no discounts to the total price" do
    expect(checkout.total).to eq(74.2)
  end
end
