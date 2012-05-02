require 'data_mapper'

DataMapper.setup(:default, 'sqlite::memory:')
#DataMapper.setup(:default, 'sqlite:///path/to/database.db')

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
  property :name, String
end

DataMapper.finalize
