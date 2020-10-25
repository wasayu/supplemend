class SupplementsController < ApplicationController
  def index
    @supplements = Supplement.order(id: :desc).page(params[:page]).per(8)
  end
  
  def show
    
  end
  
  def search
    @supplements = Supplement.all.page(params[:page]).per(8)
    
    if params[:item_name].present?
      @supplements = @supplements.where(item_name: params[:item_name])
    end
    
    if params[:price].present?
      @supplements = @supplements.where('price <= ?', params[:price])
    end
      
    if params[:brand].present?
      @supplements = @supplements.where(brand: params[:brand])
    end  
  end
  
end
