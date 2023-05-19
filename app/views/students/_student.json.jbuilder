json.extract! student, :id, :full_name, :responsible, :email, :birthdate, :username, :classroom_id, :created_at, :updated_at
json.url student_url(student, format: :json)
