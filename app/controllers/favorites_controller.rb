class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :favorite_suppl, only: %i[create destroy]
  
  def create
    supplement = Supplement.find(params[:supplement_id])
    current_user.like(supplement)
    # flash[:success] = 'サプリをお気に入りしました。'
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    supplement = Supplement.find(params[:supplement_id])
    current_user.unlike(supplement)
    # flash[:success] = 'サプリのお気に入りを解除しました。'
    # redirect_back(fallback_location: root_path)
  end
  
  private
  
  def favorite_suppl
    @supplement = Supplement.find(params[:supplement_id])
  end
end
