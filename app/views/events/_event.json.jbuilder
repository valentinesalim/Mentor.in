json.extract! event, :id, :title, :description, :category, :difficulty, :link, :created_at, :updated_at
json.url event_url(event, format: :json)
