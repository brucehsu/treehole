require 'sinatra'
require 'slim'
require 'sass'

$LOAD_PATH << '.'
require 'db'

get '/' do
  slim :index
end

get '/stylesheet.css' do
  sass :stylesheet
end
