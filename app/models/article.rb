class Article < ActiveRecord::Base
	
  extend LinkParser
	scope :reverse_chrono, -> { order("articles.created_at DESC") }
end
