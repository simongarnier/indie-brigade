json.array!(@dev_conditions) do |dev_condition|
  json.extract! dev_condition, :id, :dev_id, :condition_id
  json.url dev_condition_url(dev_condition, format: :json)
end
