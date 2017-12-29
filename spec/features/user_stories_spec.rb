describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu, sms) }
  let(:menu) { Menu.new }
  let(:dish) { Dish.new(name:'Farmhouse Pizza', price: 9.99)}
  let(:sms) { SMSService.new }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with price

  it "so that I can place an order, I can view a menu" do
    menu.add(dish)
    expect{ takeaway.view_menu }.not_to raise_error
  end

  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes

  it "so that I can place an order, I can add items to menu" do
    menu.add(dish)
    expect{ takeaway.add_to_order(dish) }.not_to raise_error
  end

  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "so that I can confirm an order, I can check the total price" do
    menu.add(dish)
    2.times { takeaway.add_to_order(dish) }
    allow(sms).to receive(:send_message).and_return(true)
    expect { takeaway.confirm_order(19.98) }.not_to raise_error
  end

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it "to confirm an order, I receive a text message" do
    menu.add(dish)
    2.times { takeaway.add_to_order(dish) }
    allow(sms).to receive(:send_message).and_return(true)
    expect(sms).to receive :send_message
    takeaway.confirm_order(19.98)
  end

end
