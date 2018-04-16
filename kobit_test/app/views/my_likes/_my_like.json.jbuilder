json.extract! my_like, :id, :name, :fruit, :created_at, :updated_at
json.url my_like_url(my_like, format: :json)
