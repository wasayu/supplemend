class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def counts(user)
    @count_likes = user.likes.count
    @count_menus = user.menus.where(saving: 1).count
    @count_using = 0
    @usings = user.calendars.all
    @usings.each do |usings|
      if usings.end_day - Date.today > 0
        @count_using += 1
      end
    end
  end
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
