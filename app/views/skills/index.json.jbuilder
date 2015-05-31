json.array!(@skills) do |skill|
  json.extract! skill, :id, :short_name, :long_name, :role_id
  json.url skill_url(skill, format: :json)
end
