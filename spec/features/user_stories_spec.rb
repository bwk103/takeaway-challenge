describe 'User Stories' do

  let(:takeaway) { Takeaway.new }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with price

  it "so that I can place an order, I can view a menu" do
    expect{ takeaway.view_menu }.not_to raise_error
  end

end
