require 'oauth'

USER_KEY = 'DTi9vV7zy07TUwua7z9LMQ'
USER_SECRET = 'JPK5K5SwylpwASx1nwNXkusrhZ1mD4l1j0uAZpsi0'

# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token(oauth_token, oauth_token_secret)
  consumer = OAuth::Consumer.new("APIKey", "APISecret",
    { :site => "http://api.twitter.com",
      :scheme => :header
    })
  # now create the access token object from passed values
  token_hash = { :oauth_token => oauth_token,
                 :oauth_token_secret => oauth_token_secret
               }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
  return access_token
end

 
# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
access_token = prepare_access_token(USER_KEY, USER_SECRET)
# use the access token as an agent to get the home timeline
response = access_token.get("https://api.twitter.com/1.1/account/settings.json")
puts response.body

# @consumer = OAuth::Consumer.new(key, secret, {
#     :site               => "http://term.ie",
#     :scheme             => :header,
#     :http_method        => :post,
#     :request_token_path => "/oauth/example/request_token.php",
#     :access_token_path  => "/oauth/example/access_token.php",
#     :authorize_path     => "/oauth/example/authorize.php"
#    })

# @request_token = @consumer.get_request_token
#   session[:request_token] = @request_token
#   redirect_to @request_token.authorize_url