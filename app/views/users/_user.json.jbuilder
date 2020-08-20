json.extract! user, :id, :fullname, :title, :expertise, :about, :content, :created_at, :updated_at
json.url user_url(user, format: :json)
