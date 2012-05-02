require 'sinatra'
require 'slim'
require 'sass'

$LOAD_PATH << '.'
require 'db'

get '/' do
  @posts = Post.all
  slim :index
end

get '/stylesheet.css' do
  sass :stylesheet
end
