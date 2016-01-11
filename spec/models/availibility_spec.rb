require "rails_helper"

RSpec.describe Availability do
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
    input = Availability.create!(project_size: @three_month, per_week: 4..6)
    results = [
      Availability.create!(project_size: @three_month, per_week: 4..9),
      Availability.create!(project_size: @three_month, per_week: 6..9),
      Availability.create!(project_size: @three_month, per_week: 1..4)
    ]
    Availability.create!(project_size: @three_month, per_week: 1..3)
    Availability.create!(project_size: @three_month, per_week: 7..9)
    Availability.create!(project_size: @three_month, per_week: 8..9)

    expect(Availability.compatible_availability(input)).to match_array(results)
  end

  it 'should select only for the given type' do
    dev = Dev.create!(name: "Simon")
    opening = Opening.create!(name: "dev")
    dev.availabilities << Availability.create!(project_size: @three_month)
    dev.availabilities << Availability.create!(project_size: @three_month)
    opening.availabilities << Availability.create!(project_size: @three_month)
    opening.availabilities << Availability.create!(project_size: @three_month)
    expect(Availability.for_available_type("Dev")).to match_array(dev.availabilities)
  end
end
