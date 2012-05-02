require 'sinatra'
require 'slim'
require 'sass'
require 'json'
require 'coffee_script'

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

post '/create/category' do
  content_type :json
  @category = Category.new(:name=>params[:name])
  if @category.save
    {:success=>true, :name=>@category.name}.to_json
  else
    {:success=>false}.to_json
  end
end

get '/stylesheet.css' do
  sass :stylesheet
end

get '/treehole.js' do
  coffee :treehole
end
