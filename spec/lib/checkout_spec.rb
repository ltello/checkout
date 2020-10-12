# frozen_string_literal: true

describe Checkout do
  let(:rules) { [] }

  describe "instance methods" do
    subject { Checkout.new(rules) }

    let(:item_a) { Item.new(name: "Lavender heart", price: 9.25) }
    let(:item_b) { Item.new(name: "B", price: 20.00) }
    let(:item_c) { Item.new(name: "C", price: 15.00) }

    describe ".rules" do
      it "return the list of discount rules to apply to the items" do
        expect(subject.rules).to eq(rules)
      end
    end

    describe ".items" do
      before do
        subject.scan(item_a)
        subject.scan(item_b)
      end

      it "return the list of items to checkout" do
        expect(subject.items).to eq([item_a, item_b])
      end
    end

    describe ".scan" do
      before do
        subject.scan(item_b)
        subject.scan(item_a)
      end

      it "add a new item to the basket" do
        expect(subject.items).to eq([item_b, item_a])
      end
    end

    describe ".total" do
      describe "when no item has been scanned" do
        it "return 0" do
          expect(subject.total).to eq(0)
        end
      end

      describe "when some items has been scanned" do
        before do
          subject.scan(item_a)
          subject.scan(item_b)
          subject.scan(item_c)
        end

        describe "when no discount rule is in place" do
          it "return the sum of the prices of the items with no discount" do
            expect(subject.total).to eq(44.25)
          end
        end

        describe "when discount rules are in place" do
          let(:rules) { [LavenderPair, Over60] }

          describe "when a new item that implies discount is added to the basket" do
            before do
              subject.scan(item_a)
            end

            it "return the sum of the prices of the items with the discount applied" do
              expect(subject.total).to eq(52.00)
            end

            describe "when a new item trigger several discounts" do
              before do
                subject.scan(item_c)
              end

              it "return the sum of the prices of the items with the discounts applied in order" do
                expect(subject.total).to eq(60.3)
              end
            end
          end
        end
      end
    end
  end
end
