class MenusController < ApplicationController
  def index
    # 後程保存する際のコードを記述
  end
  
  def show
    @menu = Menu.find(params[:id])
    @supplements = @menu.select_suppls
    
    @total_price = 0
    @supplements.each do |supplement|
      @total_price = @total_price + supplement.price
    end
  end

  def new
    @menu = Menu.new
  end

  def create
    @suggestion = Suggestion.where(suggest_params)
    
    @suggestion.each do |suggest|
      @menu = current_user.menus.build(suggestion_id: suggest.id)
      suggest.suggest_suppls.each do |supplement|
        @menu.suppl_save(supplement)
      end
    end
    
    if @menu.save
      redirect_to @menu
    else
      flash.now[:danger] = 'メニューが正しく登録されませんでした。'
      render :new
    end
  end
  
  def select
    @supplements 
  end
  
  def update
    
  end
  
  private

  def suggest_params
    params.require(:menu).permit(:purpose, :budget, :protein_flavor, :amino_flavor)
  end
end
