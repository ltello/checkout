# frozen_string_literal: true

describe Item do
  describe "instance methods" do
    let(:name)  { "A" }
    let(:price) { 30 }

    subject { Item.new(name: name, price: price) }

    describe ".name" do
      it "return the name of the item" do
        expect(subject.name).to eq(name)
      end
    end

    describe ".price" do
      it "return the price of the item" do
        expect(subject.price).to eq(price)
      end
    end
  end
end
