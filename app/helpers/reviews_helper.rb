module ReviewsHelper

  def star_rating rating
    return rating unless rating.is_a? Numeric
    '★' * rating.round + '☆' * (5 - rating.round)
  end

end
