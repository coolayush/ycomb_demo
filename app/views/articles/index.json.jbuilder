json.array!(@articles) do |article|
  json.extract! article, :id, :heading, :discription, :url
  json.url article_url(article, format: :json)
end
