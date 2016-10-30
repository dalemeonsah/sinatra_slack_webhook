require 'sinatra'
require 'rubygems'
require 'bundler/setup'
require './app/slack'
require 'json'
require 'rest-client'

get '/' do
  'hello world'
end

post '/hooks/notify-channel-test' do
  body = JSON.parse(request.body.read)
  username = body['username']
  email = body['email']

  message = "Hello, my username is #{username} and email is #{email}"
  Slack.to_channel("channel_test", message)

  message
end