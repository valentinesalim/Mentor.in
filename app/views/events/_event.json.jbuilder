json.extract! event, :id, :title, :description, :category, :link, :capacity, :created_at, :updated_at
json.url event_url(event, format: :json)
