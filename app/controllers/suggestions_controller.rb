class SuggestionsController < ApplicationController
  def index
    if params[:item_name].present?
      @suggestion = Suggestion.where('purpose = ? and budget = ? and protein_flavor = ? and amino_flavor = ?', params[:purpose], params[:budget], params[:protein_flavor], params[:amino_flavor])
    else
      @suggestion = Supplement.none
    end
    @menu = Menu.new
    @suppl_menu = SupplMenu.new
  end
  
  def create
    @suggestion = Suggestion.where('purpose = ? and budget = ? and protein_flavor = ? and amino_flavor = ?', params[:purpose], params[:budget], params[:protein_flavor], params[:amino_flavor])
  
    @menu = current_user.menus.build
    
    @suggestion.each do |suggestion|
      @suppl_menu = Suppl_menu.new(menu_id: @menu.id, supplement_id: suggestion.suggest_suppls.id, suggestion_id: suggestion.id)
    end
    
    if @menu.save && @suppl_menu.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @menu
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :index
    end
  end
end
