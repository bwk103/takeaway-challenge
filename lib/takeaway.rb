require_relative 'menu'
require_relative 'sms_service'
require 'dotenv/load'
# Parent class which manages order
class Takeaway
  attr_reader :order

  def initialize(menu, message_service = SMSService.new)
    @menu = menu
    @order = []
    @message_service = message_service
  end

  def view_menu
    @menu.view
  end

  def view_order
    @order.dup
  end

  def add_to_order(dish)
    raise "I'm sorry but you cannot order off menu" unless on_menu?(dish)
    @order.push(dish)
  end

  def confirm_order(price)
    raise "I'm sorry, that is not the correct total" unless check_total(price)
    @message_service.send_message
  end

  private

  def on_menu?(dish)
    @menu.dishes.include?(dish)
  end

  def check_total(total)
    total == @order.sum(&:price)
  end
end
