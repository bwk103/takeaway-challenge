# These are the food dishes and consist of a name and price
class Dish
  attr_reader :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end
end
