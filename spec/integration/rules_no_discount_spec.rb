# frozen_string_literal: true

describe "When discount rules are in place but no discount is appicable" do
  let(:checkout) { Checkout.new(promotional_rules) }
  let(:items) {
    [
      Item.new(name: "Lavender heart",         price: 9.25),
      Item.new(name: "Personalised cufflinks", price: 45.00),
    ]
  }
  let(:promotional_rules) { [LavenderPair, Over60] }

  before do
    items.each { |item| checkout.scan(item) }
  end

  it "apply no discount to the total price" do
    expect(checkout.total).to eq(54.25)
  end
end
