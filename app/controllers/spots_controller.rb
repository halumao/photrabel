class SpotsController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :new, :index]
  def new
    @spot = current_user.spots.build
  end

  def create
    @spot = current_user.spots.build(spot_params)
    if @spot.save
      flash[:success] = '観光地を追加しました！'
      redirect_to root_url 
    else
      flash[:danger] = '観光地の追加に失敗しました'
      render 'spots/new'
    end
  end

  def edit
    @spot = current_user.spots.find(params[:id])
  end

  def update
    @spot = current_user.spots.find(params[:id])
    
    if @spot.update(spot_params_update)
      flash[:success] = '変更しました'
      redirect_to spots_url
    else
      flash[:danger] = '変更に失敗しました'
      render :edit
    end
  end

  def show
    @spot = Spot.find(params[:id])
    review_average(@spot)
  end

  def index
    @spots = current_user.spots.order(id: :desc).page(params[:page])
  end

   def spot_review
    @spot = Spot.find(params[:id])
    @reviews = @spot.reviews.order(id: :desc).page(params[:page])
   end
  
  private
  
  def spot_params
    params.require(:spot).permit(:name, :address, :prefecture, :time_open, :time_close, :day_close, :money, :image)
  end
  def spot_params_update
    params.require(:spot).permit(:name, :address, :prefecture, :time_open, :time_close, :day_close, :money)
  end
end
