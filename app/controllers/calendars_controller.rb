class CalendarsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @calendar = Calendar.find(params[:id])
    @supplement = @calendar.supplement
    @primary_tag = SupplTag.find_by(supplement_id: @supplement.id, primary_tag: '1')
    @using_day = @supplement.use_time / @calendar.daily
    @days_left = @calendar.end_day - Date.today
  end

  def new
    @calendar = Calendar.new
    @supplement = Supplement.find(params[:supplement_id])
  end

  def create
    @calendar = current_user.calendars.build(calendar_params)
    end_day = @calendar.start_day + (@calendar.supplement.use_time / @calendar.daily)
    @calendar.end_day = end_day
    
    if @calendar.save
      flash[:success] = '使用中のサプリに登録しました。'
      redirect_to calendars_user_url(current_user)
    else
      flash.now[:danger] = 'サプリが正しく登録されませんでした。'
      render :new
    end
      
  end

  def destroy
    @calendar.destroy
    flash[:success] = '使用中のサプリを削除しました。'
    redirect_to calendars_user_url(current_user)
  end
  
  private
  
  def calendar_params
    params.require(:calendar).permit(:supplement_id, :content, :daily, :start_day)
  end
  
  def correct_user
    @calendar = current_user.calendars.find_by(id: params[:id])
    unless @calendar
      redirect_to root_url
    end
  end
  
end