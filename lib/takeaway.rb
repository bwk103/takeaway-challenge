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

  def confirm_order(price)
    fail "I'm sorry, that is not the correct total" if !check_total(price)
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def check_total(total)
    total == @order.sum(&:price)
  end

end
