json.extract! article, :id, :category, :title, :desc, :source, :author, :created_at, :updated_at
json.url article_url(article, format: :json)
