# reviews model
class Review < ActiveRecord::Base
  belongs_to :restaurant
end
