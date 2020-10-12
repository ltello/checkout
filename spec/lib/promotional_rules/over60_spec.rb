# frozen_string_literal: true

describe Over60 do
  describe "instance methods" do
    let(:items) {
      [
        Item.new(name: "A", price: 50),
        Item.new(name: "A", price: 50),
        Item.new(name: "A", price: 50),
        Item.new(name: "B", price: 40),
      ]
    }

    describe ".amount" do
      subject { Over60.new(price_before_discount, *items) }

      describe "when the discount is not applicable" do
        let(:price_before_discount) { 60.00 }

        it "return 0" do
          expect(subject.amount).to eq(0)
        end
      end

      describe "when the discount is applicable" do
        let(:price_before_discount) { 170.00 }

        it "applies a 10% discount" do
          expect(subject.amount).to eq(17.00)
        end
      end
    end
  end
end
