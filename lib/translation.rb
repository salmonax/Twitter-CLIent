#coding: utf-8

class Translation
  attr_reader :result_message

  def initialize(message, target_language)
    @language_name = titleize(target_language)
    @language_code = LANG_CODES[@language_name]
    @source_message = message
    @result_message = self.request_translation
  end

  def request_translation
    if @language_code
      encoded_message = URI.encode_www_form_component(@source_message).gsub(/\+/, '%20')
      response = Faraday.get("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20google.translate%20where%20q%3D%22#{encoded_message}%22%20and%20target%3D%22#{@language_code}%22%3B&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
      translated_result = JSON.parse(response.body)['query']['results']['json']['json'].first['json']['json'].first
    else
      translated_result = @source_message
    end
    translated_result
  end

  private

  def titleize(string)
    string.split(' ').map { |word| word.capitalize }.join(' ') if string
  end

end
