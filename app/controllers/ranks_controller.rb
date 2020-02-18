class RanksController < ApplicationController
def index
  averages = Review.select("sport_id,avg(point) as avg").group(:sport_id)
      @spots = Spot.all.each do |spot|
        spot.average = spot.average_point
      end
     
     @spots = @spots.sort_by { |spot| spot.average }
end
end
