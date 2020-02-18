class ReviewsController < ApplicationController
    before_action :require_user_logged_in, only: [:edit, :new, :index, :destroy, :show]
  def edit
    
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:success] = 'レビューを更新しました！'
      redirect_to reviews_url
    else
      flash[:danger] = 'レビューの更新に失敗しました'
      render :edit
    end
  end
  
   def new
    @spot = params[:spot_id]
    @review = current_user.reviews.build
   end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'レビューを追加しました！'
      redirect_to @review
    else
      flash[:danger] = 'レビューの追加に失敗しました'
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def index
    @reviews = current_user.reviews.order(id: :desc).page(params[:page])
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    
    flash[:success] = '削除しました'
    redirect_to reviews_url
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :content, :point, :image, :spot_id)
  end
end
