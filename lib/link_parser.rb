module LinkParser
  require 'pismo'
  
  def get_title(url)
    doc = Pismo::Document.new(url)
    doc.title
  end
end