# frozen_string_literal: true

describe "When a single discount is applicable" do
  let(:checkout) { Checkout.new(promotional_rules) }
  let(:items) {
    [
      Item.new(name: "Lavender heart",         price: 9.25),
      Item.new(name: "Personalised cufflinks", price: 45.00),
      Item.new(name: "Kids T-shirt",           price: 19.95)
    ]
  }
  let(:promotional_rules) { [LavenderPair, Over60] }

  before do
    items.each { |item| checkout.scan(item) }
  end

  it "apply the corresponding discount to the total price" do
    expect(checkout.total).to eq(66.78)
  end
end
