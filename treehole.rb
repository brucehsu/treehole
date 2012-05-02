require 'sinatra'
require 'slim'
require 'sass'

$LOAD_PATH << '.'
require 'db'

set :slim, :pretty => true

get '/' do
  @posts = Post.all
  @categories = Category.all
  @title = 'index'
  slim :index
end

get '/category/:name' do
  @category = Category.first(:name=>params[:name])
  redirect '/' if @category == nil
  @posts = Post.all(:category_id => @category.id)
  @categories = Category.all
  @title = params[:name]
  slim :index
end

get '/stylesheet.css' do
  sass :stylesheet
end


