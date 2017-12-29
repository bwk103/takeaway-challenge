require 'sms_service'

describe SMSService do
  let(:sms) { described_class.new }
  let(:time) { Time.new(2017, 'Dec', 29, 11, 0, 0, 0) }

  it { is_expected.to respond_to :send_message }
  # 
  # describe "send_message" do
  #
  #   it "calls #delivery_time" do
  #     expect(sms).to receive(:delivery_time).and_return("11:00")
  #     sms.send_message
  #   end
  #
  # end

end
