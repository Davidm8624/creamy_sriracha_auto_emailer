require 'net/smtp'

# FROM_EMAIL = "davidm8624@gmail.com"
# PASSWORD = "ipwiypixdftyvhkh"
# TO_EMAIL = "davidstechnicalsolutions@gmail.com"

# smtp = Net::SMTP.new 'davidm8624@gmail.com', 587

# message = <<END_OF_MESSAGE
# From: David <davidm8624@gmail.com>
# To: also david <davidstechnicalsolutions@gmail.com>
# Subject: Sending email with Ruby 
# Hello.
# This is an email sent with Ruby.
# END_OF_MESSAGE

# smtp.start('davidm8624@gmail.com', FROM_EMAIL, PASSWORD, :plain)
# smtp.send_message(message, FROM_EMAIL, TO_EMAIL)
# smtp.finish()



message = <<END_OF_MESSAGE
From: YourRubyApp <davidm8624@gmail.com>
To: BestUserEver <davidstechnicalsolutions@gmail.com>
Subject: ruby emailer

Lorem Ipsum
END_OF_MESSAGE

Net::SMTP.start('your.smtp.server', 25) do |smtp|
  smtp.send_message message,
    'davidm8624@gmail.com',
    'davidstechnicalsolutuions@gmail.com'
end