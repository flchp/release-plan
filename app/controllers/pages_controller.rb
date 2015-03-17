class PagesController < ApplicationController

  def welcome
    if current_user
      redirect_to problems_path
    end
  end  
end
