json.array!(@opening_skills) do |opening_skill|
  json.extract! opening_skill, :id, :opening_id, :skill_id
  json.url opening_skill_url(opening_skill, format: :json)
end
