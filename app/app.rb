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

post '/hooks/notify-channel-test-attachment' do
  body = JSON.parse(request.body.read)
  username = body['username']
  email = body['email']
  message = "Hello, my username is #{username} and email is #{email}"

  fields = [{ title: "New User Signup", value: message, short: false}]
  attachments = [attachments('New User', 'good', fields)]

  Slack.to_channel("channel_test", nil, attachments)

  message
end

# fallback and fields are required fields for message attachments.
# fallback type is string and fields are an array containing hash objects.
#
def attachments(fallback, color=nil, fields)
  {
    fallback: fallback,
    color: color,
    fields: fields
  }
end