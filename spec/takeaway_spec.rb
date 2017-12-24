require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu) }
  let(:menu_class) { double(:menu_class, :new => menu)}
  let(:menu) { double(:menu) }

  describe "#view_menu" do

    it "calls the menu's #view method" do
      expect(menu).to receive(:view)
      takeaway.view_menu
    end
  end
end
