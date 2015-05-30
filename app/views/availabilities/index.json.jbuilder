json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :per_week, :number_of_month
  json.url availability_url(availability, format: :json)
end
