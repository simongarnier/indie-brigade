json.array!(@dev_softwares) do |dev_software|
  json.extract! dev_software, :id, :dev_id, :software_id
  json.url dev_software_url(dev_software, format: :json)
end
