# frozen_string_literal: true

describe Promotion do
  class MyPromotion < Promotion
    DISCOUNT_PER_UNIT = 5

    private

    def applicable?
      item_names.include?("A")
    end

    def computed_discount
      item_names.count("A") * DISCOUNT_PER_UNIT
    end
  end

  class WrongPromotion < Promotion
  end

  describe "instance methods" do
    subject { MyPromotion.new(price_before_discount, *items) }

    let(:price_before_discount) { 60 }
    let(:items) {
      [
        Item.new(name: "A", price: 20),
        Item.new(name: "B", price: 30),
        Item.new(name: "A", price: 20)
      ]
    }

    describe "private methods" do
      subject { WrongPromotion.new(price_before_discount, *items) }

      describe ".applicable?" do
        it "raises an Exception to warn the developer to overide the method in a subclass" do
          expect { subject.send(:applicable?) }.to raise_error(Exception)
        end
      end

      describe ".computed_discount" do
        it "raises an Exception to warn the developer to overide the method in a subclass" do
          expect { subject.send(:computed_discount) }.to raise_error(Exception)
        end
      end
    end

    describe ".items" do
      it "return the list of items to which apply the discount" do
        expect(subject.items).to eq(items)
      end
    end

    describe ".price_before_discount" do
      it "return the list of items to which apply the discount" do
        expect(subject.price_before_discount).to eq(price_before_discount)
      end
    end

    describe ".amount" do
      describe "when the discount is not applicable" do
        let(:items) {
          [
            Item.new(name: "B", price: 30)
          ]
        }

        it "return 0" do
          expect(subject.amount).to eq(0)
        end
      end

      describe "when the discount is applicable" do
        it "return the computed discount amount" do
          expect(subject.amount).to eq(10)
        end
      end
    end
  end
end
