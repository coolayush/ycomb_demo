class Article < ActiveRecord::Base
	
	validates_presence_of :heading, :url
  extend LinkParser
	
	scope :reverse_chrono, -> { order("articles.created_at DESC") }
end
