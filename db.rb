require 'data_mapper'

# DataMapper.setup(:default, 'sqlite::memory:')
# This would not work, please refer to:
# http://stackoverflow.com/questions/6904298/

DataMapper.setup(:default, "sqlite://#{Dir.pwd}/database.db")

class Post
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime

  belongs_to :category
end

class Category
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String, :unique => true
end

DataMapper.finalize
