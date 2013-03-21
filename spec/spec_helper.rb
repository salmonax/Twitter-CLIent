require 'rspec'
require 'faraday'
require 'json'
require 'webmock/rspec'
require 'oauth'
require 'launchy'
require 'active_model'

require 'base64'
require 'uri'

require 'user'
require 'tweet'
require 'translation'

require 'lang_codes'


APP_KEY = 'DTi9vV7zy07TUwua7z9LMQ'
APP_SECRET = 'JPK5K5SwylpwASx1nwNXkusrhZ1mD4l1j0uAZpsi0'

VALID_SETTINGS_RESPONSE = "{\"protected\":false,\"use_cookie_personalization\":false,\"time_zone\":{\"name\":\"Arizona\",\"utc_offset\":-25200,\"tzinfo_name\":\"America\\/Phoenix\"},\"screen_name\":\"DeedleTweep\",\"sleep_time\":{\"start_time\":null,\"end_time\":null,\"enabled\":false},\"geo_enabled\":false,\"language\":\"en\",\"always_use_https\":true,\"discoverable_by_email\":false}" 
VALID_TRANSLATION_RESPONSE = "{\"query\":{\"count\":1,\"created\":\"2013-03-21T21:22:04Z\",\"lang\":\"en-US\",\"diagnostics\":{\"publiclyCallable\":\"true\",\"url\":[{\"execution-start-time\":\"14\",\"execution-stop-time\":\"122\",\"execution-time\":\"108\",\"proxy\":\"DEFAULT\",\"content\":\"http://www.datatables.org/google/google.translate.xml\"},{\"execution-start-time\":\"124\",\"execution-stop-time\":\"240\",\"execution-time\":\"116\",\"proxy\":\"DEFAULT\",\"content\":\"http://translate.google.com/translate_a/t?q=hands%20across%20the%20water&client=t&text=&sl=auto&tl=eo\"}],\"user-time\":\"241\",\"service-time\":\"224\",\"build-version\":\"34910\"},\"results\":{\"json\":{\"json\":[{\"json\":{\"json\":[\"manoj tra la akvo\",\"hands across the water\",\"\",\"\"]}},\"null\",\"en\",\"null\",{\"json\":[{\"json\":[\"manoj\",{\"json\":\"5\"},\"1\",\"0\",\"825\",\"0\",\"1\",\"0\"]},{\"json\":[\"tra\",{\"json\":\"6\"},\"1\",\"0\",\"449\",\"1\",\"2\",\"0\"]},{\"json\":[\"la akvo\",{\"json\":\"7\"},\"1\",\"0\",\"383\",\"2\",\"4\",\"0\"]}]},{\"json\":[{\"json\":[\"hands\",\"5\",{\"json\":[{\"json\":[\"manoj\",\"825\",\"1\",\"0\"]},{\"json\":[\"manojn\",\"174\",\"1\",\"0\"]},{\"json\":[\"mano\",\"0\",\"1\",\"0\"]},{\"json\":[\"manon\",\"0\",\"1\",\"0\"]}]},{\"json\":{\"json\":[\"0\",\"5\"]}},\"hands across the water\"]},{\"json\":[\"across\",\"6\",{\"json\":[{\"json\":[\"tra\",\"449\",\"1\",\"0\"]},{\"json\":[\"trans\",\"66\",\"1\",\"0\"]},{\"json\":[\"tuta\",\"0\",\"1\",\"0\"]},{\"json\":[\"la tuta\",\"0\",\"1\",\"0\"]},{\"json\":[\"alia flanko\",\"0\",\"1\",\"0\"]}]},{\"json\":{\"json\":[\"6\",\"12\"]}},\"\"]},{\"json\":[\"the water\",\"7\",{\"json\":[{\"json\":[\"la akvo\",\"383\",\"1\",\"0\"]},{\"json\":[\"la akvon\",\"66\",\"1\",\"0\"]},{\"json\":[\"de la akvo\",\"0\",\"1\",\"0\"]}]},{\"json\":{\"json\":[\"13\",\"22\"]}},\"\"]}]},\"null\",\"null\",{\"json\":{\"json\":\"en\"}},\"1\"]}}}}"