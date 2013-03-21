class User
LANGUAGES = {"fr"=>"French", "en"=>"English", "ar"=>"Arabic", "ja"=>"Japanese", "es"=>"Spanish", "de"=>"German", "it"=>"Italian", "id"=>"Indonesian", "pt"=>"Portuguese", "ko"=>"Korean", "tr"=>"Turkish", "ru"=>"Russian", "nl"=>"Dutch", "fil"=>"Filipino", "msa"=>"Malay", "zh-tw"=>"Traditional Chinese", "zh-cn"=>"Simplified Chinese", "hi"=>"Hindi", "no"=>"Norwegian", "sv"=>"Swedish", "fi"=>"Finnish", "da"=>"Danish", "pl"=>"Polish", "hu"=>"Hungarian", "fa"=>"Farsi", "he"=>"Hebrew", "ur"=>"Urdu", "th"=>"Thai"}
  
  attr_reader :access_token, :screen_name, :language

  def initialize
    @consumer = OAuth::Consumer.new(APP_KEY, APP_SECRET, :site => "https://api.twitter.com/")
    @request_token = @consumer.get_request_token(:oauth_callback => 'oob')
  end

  def authorize_url
    @request_token.authorize_url(:oauth_callback => 'oob')
  end

  def authorize!(oauth_verifier)
    @access_token = @request_token.get_access_token(:oauth_verifier => oauth_verifier)
  end

  def update_status(tweet)
    @access_token.post("https://api.twitter.com/1.1/statuses/update.json", {:status => tweet.text})
  end

  def settings!
    settings_response = @access_token.get("https://api.twitter.com/1.1/account/settings.json")
    if settings_response.body
      settings_hash = JSON.parse(settings_response.body)
      @screen_name = settings_hash['screen_name']
      lang_code = settings_hash['language']
      @language = LANGUAGES[lang_code]
    end
  end
end
