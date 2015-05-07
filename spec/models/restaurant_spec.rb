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

  describe '#average_rating' do
    context 'no reviews' do
      it 'returns "N/A" when there are no reviews' do
        restaurant = Restaurant.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end
    context 'one review' do
      it 'returns that rating' do
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end
    context 'multiple reviews' do
      it 'returns the average' do
        user1 = User.create(email: 'this@this.com', password: 'password')
        user2 = User.create(email: 'thisother@this.com', password: 'password2')
        restaurant = Restaurant.create(name: 'The Ivy')
        restaurant.reviews.create(rating: 1, user: user1)
        restaurant.reviews.create(rating: 5, user: user2)
        expect(restaurant.average_rating).to eq 3
      end
    end
  end
end
