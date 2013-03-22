require './ui_helper.rb'

APP_KEY = 'DTi9vV7zy07TUwua7z9LMQ'
APP_SECRET = 'JPK5K5SwylpwASx1nwNXkusrhZ1mD4l1j0uAZpsi0'
CALLBACK_URL = 'oob'
 
def welcome
  @user = User.new
  puts "Welcome to the amazing Epicodus Twitter client."
  puts 'To use TwitCommandLine, you need to grant access to the app.'
  puts 'Press enter to launch your web browser and grant access.'
  gets
  Launchy.open @user.authorize_url
  puts 'Now, copy the PIN below and press enter:'
  oauth_verifier = gets.chomp
  @user.authorize!(oauth_verifier)
  @user.settings!
  command_line
end

def command_line
  command = ''
  until command == 'exit'
    print '> '
    input = gets.chomp
    word_array = input.split(' ')
    command = word_array.delete_at(0)
    words = word_array.join(' ')
    case command
    when 'tweet'
      make_tweet(words)
    when 'list'
      list(words)
    when 'exit'
      puts "Exiting."
    end
  end
end

def list(words)
  case words
  when 'my settings'
    puts "Screen Name: #{@user.screen_name}"
    puts "Language: #{@user.language}"
  when 'my followers'
    puts @user.followers
  when "who I'm following"
    puts @user.following
  # when 'home timeline'
  #   puts @user.home_timeline
  end
end

def make_tweet(words)
  chunk_array = words.split('"')
  chunk_array.delete("")
  target_language = chunk_array.last.split(' ').last if chunk_array.length > 1
  tweet = Tweet.new(chunk_array.first)
  tweet.translate_to(target_language)
  if tweet.valid?
    @user.update_status(tweet)
    puts "Tweet posted, @#{@user.screen_name}!"
  else
    puts "Invalid tweet! Your tweet must be between 1 and 140 characters."
  end
end

welcome