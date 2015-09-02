# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ArticleUrls = 
[
  "http://listverse.com/2013/05/07/10-mind-bending-discoveries-in-physics/",
  "http://www.science.uwa.edu.au/courses/facts/physics",
  "http://www.sciensational.com/physics.html",
  "http://regentsprep.org/regents/physics/101facts/101facts.cfm",
  "http://www.sciencekids.co.nz/sciencefacts/physics.html",
  "http://kizaz.com/2013/04/15/10-most-mind-bending-physics-facts/",
  "http://www.telegraph.co.uk/news/science/6546462/The-10-weirdest-physics-facts-from-relativity-to-quantum-physics.html",
  "http://physics-lovers.blogspot.in/2010/02/interesting-facts-of-physics.html",
  "http://whatthafact.com/interesting-facts-about-physics/",
  "http://www.physicsoftheuniverse.com/facts.html",
  "http://topyaps.com/top-10-mind-blowing-facts-about-physics"
]

Article.destroy_all

ArticleUrls.each do |url|
  title = Article.get_title(url)
  Article.create(url: url, title: title)
end