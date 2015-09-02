class Article < ActiveRecord::Base
	
	validates_presence_of :title, :url
	validates_uniqueness_of :url, :title
  extend LinkParser
	
	scope :reverse_chrono, -> { order("articles.created_at DESC") }
end
