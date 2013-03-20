require 'oauth'
require 'launchy'
 
CONSUMER_KEY = 'your_consumer_key'
CONSUMER_SECRET = 'your_consumer_secret'
CALLBACK_URL = 'oob'
 
consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, :site => "https://api.twitter.com/")
request_token = consumer.get_request_token(:oauth_callback => CALLBACK_URL)
 
puts 'To use TwitCommandLine, you need to grant access to the app.'
puts 'Press enter to launch your web browser and grant access.'
gets
Launchy.open request_token.authorize_url(:oauth_callback => CALLBACK_URL)
 
puts 'Now, copy the PIN below and press enter:'
oauth_verifier = gets.chomp
access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)
 
response = access_token.get('https://api.twitter.com/1.1/account/settings.json')
response.body