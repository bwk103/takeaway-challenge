# Contains a collection of dishes for the user to select
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    raise 'Only dishes can be added to the menu' unless check_dish(dish)
    raise 'That dish is already on the menu' if check_menu(dish)
    @dishes.push(dish)
  end

  def remove(dish)
    @dishes.delete(dish)
  end

  def view
    @dishes.dup
  end

  private

  def check_menu(dish)
    @dishes.include? dish
  end

  def check_dish(dish)
    dish.is_a? Dish
  end
end
