require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = FactoryGirl.create(:user)
    UserMailer.welcome_email(@user).deliver_now
    UserMailer.weather_email(@user).deliver_now
    UserMailer.reminder_email(@user).deliver_now
end 

  it 'should send an email' do
    ActionMailer::Base.deliveries.count == 3
  end
  it 'renders the receiver email' do
    ActionMailer::Base.deliveries.first.to == @user.email
  end

  it 'renders the sender email' do  
    ActionMailer::Base.deliveries.first.from == ['noreply@example.com']
  end

  after(:each) do
  ActionMailer::Base.deliveries.clear
end
end
