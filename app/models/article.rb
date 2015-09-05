class Article < ActiveRecord::Base
  extend LinkParser
	
  has_and_belongs_to_many :users

  self.per_page = 10
	
	validates_presence_of :title, :url
	validates :url, uniqueness: {message: "This article is already present"}
	
	scope :reverse_chrono, -> { order("articles.created_at DESC") }
end
