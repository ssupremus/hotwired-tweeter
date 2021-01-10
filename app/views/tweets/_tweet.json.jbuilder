json.extract! tweet, :id, :body, :likes, :comments, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
