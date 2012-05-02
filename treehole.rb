require 'sinatra'
require 'slim'
require 'sass'

get '/' do
  slim :index
end

get '/stylesheet.css' do
  sass :stylesheet
end
