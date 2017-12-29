require_relative 'menu'

class Takeaway

  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def view_menu
    @menu.view
  end

  def view_order
    @order.dup
  end

  def add_to_order(dish)
    fail "I'm sorry but you cannot order off menu" if !on_menu?(dish)
    @order.push(dish)
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

end
