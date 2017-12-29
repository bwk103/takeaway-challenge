require 'dish'

describe Dish do
  let(:dish) { described_class.new(name: 'Cheese Pizza', price: 5.00) }

  context 'defaults' do
    it 'has a name' do
      name = 'Cheese Pizza'
      expect(dish.name).to eq name
    end

    it 'has a price' do
      price = 5.00
      expect(dish.price).to eq price
    end
  end
end
