json.extract! admin, :id, :first_name, :last_name, :email, :password_digest, :user_id, :created_at, :updated_at
json.url admin_url(admin, format: :json)