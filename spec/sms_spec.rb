require 'sms_service'

describe SMSService do
  let(:sms) { described_class.new }
  # let(:time) { Time.new(2017, 'Dec', 29, 11, 0, 0, 0) }
  let(:client) { double(:client) }

  it { is_expected.to respond_to :send_message }

  describe 'send_message' do
    let(:client) { double :client }
    it 'can send text' do
      message = 'Thank you! Your order has been placed.'
      twilio_message_body = { from: ENV['SEND_NUM'], to: ENV['RECEIVE_NUM'], body: message }
      allow(client).to receive_message_chain(:messages, :create).with(twilio_message_body)
      expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACC'], ENV['TWILIO_TOKEN']).and_return(client)
      sms.send_message
    end
  end
end
