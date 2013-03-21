require './ui_helper.rb'

CONSUMER_KEY = 'DTi9vV7zy07TUwua7z9LMQ'
CONSUMER_SECRET = 'JPK5K5SwylpwASx1nwNXkusrhZ1mD4l1j0uAZpsi0'
CALLBACK_URL = 'oob'
 
consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, :site => "https://api.twitter.com/")
request_token = consumer.get_request_token(:oauth_callback => CALLBACK_URL)

def welcome
  user = User.new
  puts "Welcome to the amazing Epicodus Twitter client."
  puts 'To use TwitCommandLine, you need to grant access to the app.'
  puts 'Press enter to launch your web browser and grant access.'
  gets
  Launchy.open user.authorize_url
  puts 'Now, copy the PIN below and press enter:'
  oauth_verifier = gets.chomp
  user.authorize!(oauth_verifier)
  command_line
end

def command_line
  command = ''
  until command == 'exit'
    print '> '
    command_and_args = gets.chomp.split(' ')
    command = command_and_args.first
    case command
    when 'hello'
      puts "Hi there."
    when 'exit'
      puts "Exiting."
    end
  end
end

welcome