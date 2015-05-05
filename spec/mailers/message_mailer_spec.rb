require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @message = Message.new 
    @message.name = "name"
    @message.email = "email@email.com"
    @message.content = "some words"
    MessageMailer.new_message(@message).deliver_now
  end
  it 'should send an email' do
    ActionMailer::Base.deliveries.count == 1
  end

  it 'renders the sender email' do  
    ActionMailer::Base.deliveries.first.from == ['noreply@example.com']
  end


  after(:each) do
  ActionMailer::Base.deliveries.clear
end
end
