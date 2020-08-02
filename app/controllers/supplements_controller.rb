class SupplementsController < ApplicationController
  def index
  end
  
  def search
    if params[:item_name].present? && params[:price].present?
      @supplements = Supplement.where('item_name = ? and price < ?', params[:item_name], params[:price]).page(params[:page]).per(8)
    elsif params[:item_name].present?
      @supplements = Supplement.where(item_name: params[:item_name]).page(params[:page]).per(8)
    else
      @supplements = Supplement.none
    end
  end
end
