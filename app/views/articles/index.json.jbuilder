json.array!(@articles) do |article|
  json.extract! article, :titulo, :contenido
  json.url article_url(article, format: :json)
end
