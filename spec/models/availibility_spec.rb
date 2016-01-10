require "rails_helper"

RSpec.describe Availability, '.compatible_availability' do
  before(:all) do
    @jam = ProjectSize.create!(text: "jam", need_involvement: false)
    @three_month = ProjectSize.create!(text: "3 month", need_involvement: true)
  end

  after(:all) do
    @jam.destroy
    @three_month.destroy
  end

  it 'should disregard per_week when need_involvement is false in ProjectSize' do
    input = Availability.create!(project_size: @jam, per_week: 2..6)
    results = Availability.create!(project_size: @jam, per_week: 8..9)
    Availability.create!(project_size: @three_month, per_week: 8..9)

    expect(Availability.compatible_availability(input)).to eq([results])
  end

  it 'should check per_week overlap when need_involvement is true' do
    input = Availability.create!(project_size: @three_month, per_week: 2..6)
    results = [
      Availability.create!(project_size: @three_month, per_week: 4..9),
      Availability.create!(project_size: @three_month, per_week: 6..9)
    ]
    Availability.create!(project_size: @three_month, per_week: 8..9)

    expect(Availability.compatible_availability(input)).to match_array(results)
  end
end
