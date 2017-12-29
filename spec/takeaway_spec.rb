require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu) }
  let(:menu_class) { double(:menu_class, :new => menu)}
  let(:menu) { double(:menu, :dishes => [dish, dish2]) }
  let(:dish) { double(:dish) }
  let(:dish2) { double(:dish) }

  context "defaults" do
    it "has an empty order collection" do
      expect(takeaway.order).to eq []
    end

  end

  describe "#view_menu" do

    it "calls the menu's #view method" do
      expect(menu).to receive(:view)
      takeaway.view_menu
    end
  end

  describe "#add_to_order" do

    it "adds a dish to the order" do
      takeaway.add_to_order(dish)
      expect(takeaway.order).to include dish
    end

    it "raises an error if the dish is not on the menu" do
      message = "I'm sorry but you cannot order off menu"
      expect { takeaway.add_to_order('Something else') }.to raise_error message
    end
  end

  describe "#view_order" do

    it "returns a copy of the order collection" do
      3.times { takeaway.add_to_order(dish) }
      expect(takeaway.view_order).to eq takeaway.order
    end

  end
end
