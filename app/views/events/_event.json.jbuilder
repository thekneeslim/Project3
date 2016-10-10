json.extract! event, :id, :date, :start, :end, :description, :location, :created_at, :updated_at
json.url event_url(event, format: :json)