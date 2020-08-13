class MenusController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :edit]
  before_action :correct_user, only: [:destroy]
  
  def index
    # 後程保存する際のコードを記述
  end
  
  def show
    @menu = Menu.find(params[:id])
    @supplements = @menu.select_suppls
    @suggestion = @menu.suggestion
    
    @total_price = 0
    @supplements.each do |supplement|
      @total_price = @total_price + supplement.price
    end
  end

  def new
    @menu = Menu.new
  end

  def create
    @suggestion = Suggestion.where(menu_params)
    
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
  
  def edit
    @menu = Menu.find(params[:id])
    @before_suppl = Supplement.find_by(id: params[:supplement_id])
    @similar_suppls = Supplement.where('item_name = ? and price >= ? and price <= ?', @before_suppl.item_name, @before_suppl.price - 1000, @before_suppl.price + 1000)
  end
  
  def update
    @menu = Menu.find(params[:id])
    
    # 提案メニューに同じ商品が二つある場合、最初の一つを変更
    @suppl_menu = SupplMenu.find_by(menu_id: @menu.id, supplement_id: params[:before_suppl_id])
    
    if params[:supplement_id]
      if @suppl_menu.update(supplement_id: params[:supplement_id])
        flash[:success] = '変更しました'
        redirect_to @menu
      else
        flash.now[:danger] = '変更できませんでした。'
        render :edit
      end
    else
      if @menu.update(name: menu_params[:name], saving: 1)
        flash[:success] = 'メニューを保存しました。'
        redirect_to menus_user_path(current_user)
      else
        flash.now[:danger] = 'メニューの保存に失敗しました。'
        render @menu
      end
    end
  end
  
  def destroy
    @menu.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def menu_params
    params.require(:menu).permit(:purpose, :budget, :protein_flavor, :amino_flavor, :name)
  end

  def correct_user
    @menu = current_user.menus.find_by(id: params[:id])
    unless @menu
      redirect root_url
    end
  end

end
