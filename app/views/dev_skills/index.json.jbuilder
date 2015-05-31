json.array!(@dev_skills) do |dev_skill|
  json.extract! dev_skill, :id, :dev_id, :skill_id
  json.url dev_skill_url(dev_skill, format: :json)
end
