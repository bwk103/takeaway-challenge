describe 'User Stories' do

  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { Menu.new }
  let(:dish) { Dish.new(name:'Farmhouse Pizza', price: 9.99)}

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

end
