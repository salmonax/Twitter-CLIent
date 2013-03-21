#coding: utf-8
require 'spec_helper'

describe Translation do
  let(:message) {"hands across the water"}
  let(:encoded_message) {URI.encode_www_form_component(message).gsub(/\+/, '%20')}
  let(:language) { "Esperanto" }
  let(:language_code) {LANG_CODES[language]}
  let(:request_stub) {stub_request(:get, "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20google.translate%20where%20q%3D%22#{encoded_message}%22%20and%20target%3D%22#{language_code}%22%3B&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").
     to_return(:status => 200, :body => VALID_TRANSLATION_RESPONSE, :headers => {})}
  let(:translation_instance) { Translation.new(message,language.downcase)}

  context '#result_message' do
    it 'returns the resulting translation message' do
      request_stub
      translation_instance.result_message.should eq 'manoj tra la akvo'
    end

  end

  context '#initialize' do
    it 'initializes with a message object and a language string as an argument' do
      stub = request_stub
      translation_instance
      stub.should have_been_requested
    end

    it 'initializes with some text and a string representing the target language name as an argument' do
      request_stub
      translation_instance.should be_an_instance_of Translation
    end
  end
  
end