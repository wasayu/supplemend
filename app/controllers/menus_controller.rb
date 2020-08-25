class MenusController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :edit]
  before_action :correct_user, only: [:destroy]
  
  def index
  end
  
  def show
    @menu = Menu.find(params[:id])
    @supplements = @menu.select_suppls
    @suggestion = @menu.suggestion
    @tags = []
    @supplements.each do |suppl|
      @primary_tag = SupplTag.where('supplement_id = ? and primary_tag = ?', suppl.id, 1)
      @primary_tag.each do |primary_tag|
        @tags.push(primary_tag.tag)
      end
    end

    @total_price = 0
    @month_price = 0
    @calorie = 0
    @protein = 0
    @lipid = 0
    @carbo = 0
    @supplements.each do |supplement|
      @total_price += supplement.price
      @month_price += (supplement.price * (30 / supplement.use_time.to_f))
      
      if supplement.calorie.present?
        @calorie += supplement.calorie
      end
      
      if supplement.protein.present?
        @protein += supplement.protein
      end
      
      if supplement.lipid.present?
        @lipid += supplement.lipid
      end
      
      if supplement.carbo.present?
        @carbo += supplement.carbo
      end
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
    
    @suggestion = @menu.suggestion
    @budget = @suggestion.budget
    
    @before_suppls = @menu.select_suppls
    @total_price = 0
    @month_price = 0
    @before_suppls.each do |supplement|
      @total_price = @total_price + supplement.price
      @month_price += (supplement.price * (30 / supplement.use_time.to_f))
    end
    
    @balance = @budget - (@total_price - @before_suppl.price)

    @similar_tag = Tag.find_by(content: params[:tag_content])
    @suppl_id = SupplTag.where('tag_id = ? and primary_tag = ?', @similar_tag.id, 1)

    @suppls = []
    @suppl_id.each do |suppl|
      @suppls.push(suppl.supplement)
    end
    
    @array = []
    @suppls.each do |suppl|
      @suppl_price = suppl.price
      if (suppl.use_time >=  (@before_suppl.use_time - 10)) and (suppl.use_time <= (@before_suppl.use_time + 10)) and (@suppl_price <= @balance)
        @array.push(suppl)
      end
    end
    
    @supplements = Kaminari.paginate_array(@array).page(params[:page]).per(8)
    
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
    params.require(:menu).permit(:purpose, :budget, :name)
  end

  def correct_user
    @menu = current_user.menus.find_by(id: params[:id])
    unless @menu
      redirect root_url
    end
  end

end
