json.extract! room, :id, :room_number, :description, :room_category_id, :created_at, :updated_at
json.url room_url(room, format: :json)
