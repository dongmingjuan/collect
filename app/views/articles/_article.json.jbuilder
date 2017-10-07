json.extract! article, :id, :title, :content, :from, :view_count, :created_at, :updated_at
json.url article_url(article, format: :json)
