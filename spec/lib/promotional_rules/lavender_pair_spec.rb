# frozen_string_literal: true

describe LavenderPair do

  describe "instance methods" do
    let(:items) {
      [
        Item.new(name: "Lavender heart", price: 9.25),
        Item.new(name: "Lavender heart", price: 9.25),
        Item.new(name: "Lavender heart", price: 9.25),
        Item.new(name: "Lavender heart", price: 9.25),
        Item.new(name: "Lavender heart", price: 9.25),
      ]
    }
    subject { LavenderPair.new(300, *items) }

    describe "#item_name" do
      it "return 'Lavender heart'" do
        expect(subject.item_name).to eq("Lavender heart")
      end
    end

    describe "#pair_price" do
      it "return 17.00" do
        expect(subject.pair_price).to eq(17.0)
      end
    end

    describe "#amount" do
      it "applies a discount of 1.50 to each pair of Lavender products" do
        expect(subject.amount).to eq(3.00)
      end
    end
  end
end
