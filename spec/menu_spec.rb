require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dish) { double(:dish, name: 'Cheese Pizza', price: 5.99, is_a?: true) }

  context 'defaults' do
    it 'has an empty array of dishes' do
      expect(menu.dishes).to eq []
    end
  end

  describe '#add' do
    before(:each) do
      menu.add(dish)
    end

    it 'adds a dish to the dishes collected' do
      expect(menu.dishes).to include dish
    end

    it 'does not add a dish if it already exists on the menu' do
      message = 'That dish is already on the menu'
      expect { menu.add(dish) }.to raise_error message
    end

    it 'only permits dishes to be added to the menu' do
      message = 'Only dishes can be added to the menu'
      expect { menu.add('Something_else') }.to raise_error message
    end
  end

  describe '#remove' do
    before(:example) do
      menu.add(dish)
      menu.remove(dish)
    end

    it 'removes a dish from the menu' do
      expect(menu.dishes).not_to include dish
    end
  end

  describe '#view' do
    it 'returns a copy of the dishes' do
      expect(menu.view).to eq menu.dishes
    end
  end
end
