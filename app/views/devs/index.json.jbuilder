json.array!(@devs) do |dev|
  json.extract! dev, :id, :name, :description, :role_id, :availability_id
  json.url dev_url(dev, format: :json)
end
