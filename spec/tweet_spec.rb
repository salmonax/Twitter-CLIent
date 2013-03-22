#coding: utf-8

require 'spec_helper'

describe Tweet do
  let(:valid_text) {"Pretty much the first awesome tweet of the morning."}
  let(:empty_text) {''}
  let(:verbose_text) {"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vehicula ante at eros fermentum pulvinar. Mauris in metus sit amet turpis orci aliquam"}
  let(:message) {"hands across the water"}
  let(:encoded_message) {URI.encode_www_form_component(message).gsub(/\+/, '%20')}
  let(:language) { "Esperanto" }
  let(:language_code) {LANG_CODES[language]}
   let(:request_stub) {stub_request(:get, "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20google.translate%20where%20q%3D%22#{encoded_message}%22%20and%20target%3D%22#{language_code}%22%3B&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").
     to_return(:status => 200, :body => VALID_TRANSLATION_RESPONSE, :headers => {})}

  context '#initialize' do
    it 'initializes with text as an argument' do
      tweet = Tweet.new(valid_text)
      tweet.should be_an_instance_of Tweet
    end
  end

  context 'attr_readers' do
    it 'reads the attribute for text' do
      tweet = Tweet.new(valid_text)
      tweet.text.should eq valid_text
    end
  end

  context '#valid?' do
    it 'is valid when text is between 1 and 140 characters' do
      tweet = Tweet.new(valid_text)
      tweet.valid?.should be_true
    end

    it 'is invalid when text is empty' do
      tweet = Tweet.new(empty_text)
      tweet.valid?.should be_false
    end

    it 'is invalid when passed in nil' do
      tweet = Tweet.new(nil)
      tweet.valid?.should be_false
    end


    it 'is invalid when text is longer than 140 characters' do
      tweet = Tweet.new(verbose_text)
      tweet.valid?.should be_false
    end
  end

  context '#translate_to' do
    it 'translates the message to the language passed in the argument' do
      request_stub
      tweet = Tweet.new(message)
      tweet.translate_to(language)
      tweet.text.should eq 'manoj tra la akvo'
    end
  end
end