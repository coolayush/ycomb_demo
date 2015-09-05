class Article < ActiveRecord::Base
	
	validates_presence_of :title, :url
	validates :url, uniqueness: {message: "Article associated to this url already added"}
  extend LinkParser
	
	scope :reverse_chrono, -> { order("articles.created_at DESC") }
end
