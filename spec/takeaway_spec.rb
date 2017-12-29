require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, sms) }
  let(:menu_class) { double(:menu_class, :new => menu)}
  let(:menu) { double(:menu, :dishes => [dish, dish2]) }
  let(:dish) { double(:dish, :price => 5.00) }
  let(:dish2) { double(:dish) }
  let(:sms) { double(:sms_service, :send_message => true) }

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

  describe "#confirm_order" do
    it "responds to confirm_order" do
      expect(takeaway).to respond_to(:confirm_order).with(1).argument
    end

    context "when user provides correct total" do
      it "calls #send_message on the SMS Service" do
        2.times { takeaway.add_to_order(dish) }
        expect(sms).to receive(:send_message)
        takeaway.confirm_order(10.00)
      end
    end

    context "when user provides the incorrect total" do

      it "raises an error" do
        2.times { takeaway.add_to_order(dish) }
        message = "I'm sorry, that is not the correct total"
        expect { takeaway.confirm_order(11.00) }.to raise_error message
      end
    end
  end
end
