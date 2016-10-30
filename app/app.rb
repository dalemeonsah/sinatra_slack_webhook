require 'sinatra'
require 'rubygems'
require 'bundler/setup'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  'hello world'
end