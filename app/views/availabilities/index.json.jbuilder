json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :availability_per_week_id, :availability_duration_id
  json.url availability_url(availability, format: :json)
end
