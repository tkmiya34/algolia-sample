json.set! :users do
  json.array! @users do |user|
    json.extract! user, :id, :name, :email, :birth_date, :created_at, :updated_at
  end
end