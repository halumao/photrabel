class SearchesController < ApplicationController
  def searchname
    @spots = Spot.searchname(params[:search])
  end
  
  def searchpre
    @spots = Spot.searchpre(params[:search])
  end
end
