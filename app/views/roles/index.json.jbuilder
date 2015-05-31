json.array!(@roles) do |role|
  json.extract! role, :id, :code
  json.url role_url(role, format: :json)
end
