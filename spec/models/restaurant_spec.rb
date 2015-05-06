require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many(:reviews).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: 'KF')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "Blakeman's burger")
    restaurant = Restaurant.new(name: "Blakeman's burger")
    expect(restaurant).to have(1).error_on(:name)
  end
end
