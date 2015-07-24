class Post < ActiveRecord::Base
  belongs_to :use
  validates_presence_of :content
end
