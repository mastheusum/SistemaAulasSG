json.extract! lesson, :id, :title, :description, :homework, :classroom_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
