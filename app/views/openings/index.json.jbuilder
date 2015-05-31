json.array!(@openings) do |opening|
  json.extract! opening, :id, :name, :role_id, :availability_id
  json.url opening_url(opening, format: :json)
end
