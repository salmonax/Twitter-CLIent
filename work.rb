require 'oauth'
require 'launchy'
 
consumer = OAuth::Consumer.new('DTi9vV7zy07TUwua7z9LMQ', 'JPK5K5SwylpwASx1nwNXkusrhZ1mD4l1j0uAZpsi0', :site => "https://api.twitter.com/")
request_token = consumer.get_request_token(:oauth_callback => 'oob')
 
puts 'To use TwitCommandLine, you need to grant access to the app.'
puts 'Press enter to launch your web browser and grant access.'
gets
Launchy.open request_token.authorize_url(:oauth_callback => 'oob')
 
puts 'Now, copy the PIN below and press enter:'
oauth_verifier = gets.chomp
access_token = request_token.get_access_token(:oauth_verifier => oauth_verifier)
 
response = access_token.get('https://api.twitter.com/1.1/account/settings.json')
puts response.body

#Stuff for the model

tweet = access_token.post('https://api.twitter.com/1.1/account/settings.json')

home_timeline = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")

#post['user']['name']

user_timeline = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{SCREEN_NAME}&count=#{NUMBER_OF_POSTS}")


user_timeline = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=DeedleTweep")

tweet = access_token.post("https://api.twitter.com/1.1/statuses/update.json", {:status => "my latest tweet"})

status=Maybe%20he%27ll%20finally%20find%20his%20keys.%20%23peterfalk