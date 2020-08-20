json.extract! appointment, :id, :status, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
