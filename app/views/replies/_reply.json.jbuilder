json.extract! reply, :id, :string, :references, :created_at, :updated_at
json.url reply_url(reply, format: :json)
