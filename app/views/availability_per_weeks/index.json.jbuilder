json.array!(@availability_per_weeks) do |availability_per_week|
  json.extract! availability_per_week, :id, :name
  json.url availability_per_week_url(availability_per_week, format: :json)
end
