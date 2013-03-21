#coding: utf-8

require 'spec_helper'

describe User do
  
  let(:init_stub) {stub_request(:post, "https://api.twitter.com/oauth/request_token").
    to_return(:body => "oauth_token=t&oauth_token_secret=s")}
   
  let(:access_stub) {stub_request(:post, "https://api.twitter.com/oauth/access_token").
    to_return(:body => "oauth_token=at&oauth_token_secret=as&screen_name=sn")}


  let(:settings_stub) { stub_request(:get, "https://api.twitter.com/1.1/account/settings.json").
          to_return(:status => 200, :body => VALID_SETTINGS_RESPONSE, :headers => {}) }

  context 'attr_readers' do
    it "returns the user's access token object with #access_token" do
      init_stub
      access_stub
      user = User.new
      user.authorize!('Junk')
      user.access_token.should be_an_instance_of OAuth::AccessToken 
    end

    it "returns the user's screen name with #screen_name" do
      init_stub
      access_stub
      settings_stub
      user = User.new
      user.authorize!('More junk')
      user.settings!
      user.screen_name.should eq 'DeedleTweep' 
    end

    it "returns the user's language pref" do
      init_stub
      access_stub
      settings_stub
      user = User.new
      user.authorize!('More junk')
      user.settings!
      user.language.should eq 'English'
    end
  end

  context '#initialize' do
    it 'initializes' do
      init_stub
      user = User.new
      user.should be_an_instance_of User
    end

    it 'POSTs a request' do
      stub = init_stub
      User.new
      stub.should have_been_requested
    end
  end

  context '#authorize_url' do 
    it 'returns a url for authorization' do
      stub = init_stub
      user = User.new
      user.authorize_url
      stub.should have_been_requested
    end
  end

  context '#authorize!' do 
    it 'sets the access token for the user' do 
      init_stub
      stub = access_stub
      user = User.new
      user.authorize!('SDFSDFSDFS')
      stub.should have_been_requested
    end  
  end

  context '#settings!' do
    it 'GETs a request for user account settings' do
      init_stub
      access_stub
      stub = settings_stub
      user = User.new
      user.authorize!('ASDASDSAD')
      user.settings!  
      stub.should have_been_requested
    end
  end
end