require 'pony'
require 'date'

# Method to read email content from a text file
def read_email_content(file_path)
  File.read(file_path)
end

# Method to keep track of the number of emails sent, we need this because if you set up a scheduler (i use cron jobs for most stuff like this) to have it say go off at midnight/noon after the email is send the ruby application will close out and any data in count will be erased from memory. We need somewhere to keep the current increment at during the inactive time.
def increment_email_count(file_path)
  if File.exist?(file_path)
    count = File.read(file_path).to_i
    count += 1
  else
    count = 1
  end
  File.write(file_path, count)
  count
end

# Email configuration
Pony.options = {
  via: :smtp,
  via_options: {
    address: 'smtp.gmail.com', # replace with your providers address
    port: '587', # leave this alone unless you know what your doing
    enable_starttls_auto: true,
    user_name: '<your_email@gmail.com>',
    password: '<your_password>', # this is not your email password. With google it will provide you a KEY to use for "less secure apps", put that here.
    authentication: :plain, # :plain, :login, :cram_md5, no auth by default
    domain: "localhost.localdomain" # the HELO domain provided by the client to the server
  }
}

# Path to the email content file and email count file
email_content_file = 'email_content.txt'
email_count_file = 'email_count.txt'

# Read email content
email_content = read_email_content(email_content_file)

# Increment and get the email count
email_count = increment_email_count(email_count_file)

# Prepare the email body with the email count
email_body = "#{email_content}\n\nEmails sent so far: #{email_count}"

# Send the email
Pony.mail(
  to: '<recipient_email@example.com>',
  from: '<your_email@gmail.com>', # same as above
  subject: 'This is an email',
  body: email_body
)

puts "Email sent successfully with the content:\n#{email_body}" # this will be the output in your terminal when this is ran, it wont be included in the email body.
