require 'twilio-ruby'
# Sends confirmation SMS to user using Twilio
class SMSService
  def send_message
    @client = Twilio::REST::Client.new ENV['TWILIO_ACC'], ENV['TWILIO_TOKEN']
    @client.messages.create(
      from: ENV['SEND_NUM'],
      to: ENV['RECEIVE_NUM'],
      body: "Thank you! Your order has been placed."
    )
  end

  private

  # def delivery_time
  #   now_time.strftime('%H:%M')
  # end
  #
  # def now_time
  #   Time.now + (60 * 60)
  # end
end
