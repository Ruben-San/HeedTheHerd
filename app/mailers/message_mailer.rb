class MessageMailer < ApplicationMailer
   default from: "Your Mailer <noreply@yexample.com>"
  default to: "Nicole Radford <nradford0171@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
end
