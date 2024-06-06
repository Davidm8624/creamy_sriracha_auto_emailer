# for those wondering, yes, after this project the key will be deleted

# require 'net/smtp'

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

# message = <<END_OF_MESSAGE
# From: YourRubyApp <davidm8624@gmail.com>
# To: BestUserEver <davidstechnicalsolutions@gmail.com>
# Subject: ruby emailer

# Lorem Ipsum
# END_OF_MESSAGE

# Net::SMTP.start('your.smtp.server', 25) do |smtp|
#   smtp.send_message message,
#     'davidm8624@gmail.com',
#     'davidstechnicalsolutuions@gmail.com'
# end

require 'pony'

# Pony.mail({
#   :to => 'davidstechnicalsolutions@gmail.com',
#   :via => :smtp,
#   :subject  => 'this is the subject',
#   :body => 'this is the text in email' + num + '. How many more will there be?',
#   :via_options => {

#     :address              => 'smtp.gmail.com',
#     :port                 => '587',
#     :enable_starttls_auto => true,
#     :user_name            => 'davidm8624',
#     :password             => 'ipwiypixdftyvhkh',
#     :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
#     :domain               => "localhost.localdomain", # the HELO domain provided by the client to the server

#   }
# })

# Pony.mail(:to => 'davidstechnicalsolutions@gmail.com', :from => 'davidm8624@gmail.com', :subject => 'hi', :body => 'Hello there.')

num = 0
puts "how many emails would you like to send?"
times_to_spam = gets

def bot(num, times_to_spam)
  until (num == times_to_spam) do
    Pony.mail({
                :to => 'davidstechnicalsolutions@gmail.com',
                :via => :smtp,
                :subject => 'Bring back Srircha sauce!',
                :body => "This is automated email number #{num}. Dont bother responding. Bring back Sriracha sauce!",
                :via_options => {

                  :address => 'smtp.gmail.com',
                  :port => '587',
                  :enable_starttls_auto => true,
                  :user_name => 'davidm8624',
                  :password => 'ipwiypixdftyvhkh',
                  :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
                  :domain => "localhost.localdomain", # the HELO domain provided by the client to the server

                }
              })

    num = num + 1

  end
end

bot()

# problem with this setup is that num is set back t 0 every time rather then counting up every time. Will be adding txt file to save it under.
# next i need to change it to a for loop accepting the # of emails that I want to send.
