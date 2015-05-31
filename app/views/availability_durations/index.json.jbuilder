json.array!(@availability_durations) do |availability_duration|
  json.extract! availability_duration, :id, :name
  json.url availability_duration_url(availability_duration, format: :json)
end
