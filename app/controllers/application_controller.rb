class ApplicationController < ActionController::Base
    include SessionsHelper
    
    
    private
    
    def require_user_logged_in
        unless logged_in?
          redirect_to login_url
        end
    end
    
    def review_count(spot)
        @count_review = spot.reviews.count
    end
    def review_average(spot)
       @average_review = spot.reviews.average(:point)
    end
end
