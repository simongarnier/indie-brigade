json.array!(@opening_softwares) do |opening_software|
  json.extract! opening_software, :id, :opening_id, :software_id
  json.url opening_software_url(opening_software, format: :json)
end
