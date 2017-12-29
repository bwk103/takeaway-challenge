require 'twilio-ruby'

class SMSService

  def send_message
    @client = Twilio::REST::Client.new ENV['TWILIO_ACC'], ENV['TWILIO_TOKEN']
    @client.api.account.messages.create(
    from: '+441315105475',
    to: '+447921613637',
    body: "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  )
  end

  private
  
  def delivery_time
    get_time.strftime("%H:%M")
  end

  def get_time
    Time.now + (60 * 60)
  end

end
