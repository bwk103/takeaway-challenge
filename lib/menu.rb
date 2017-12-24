class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    fail 'Only dishes can be added to the menu' if !checkDish(dish)
    fail 'That dish is already on the menu' if checkMenu(dish)
    @dishes.push(dish)
  end

  def remove(dish)
    @dishes.delete(dish)
  end

  def view
    @dishes.dup
  end

  private

  def checkMenu(dish)
    @dishes.include? dish
  end

  def checkDish(dish)
    dish.is_a? Dish
  end

end
