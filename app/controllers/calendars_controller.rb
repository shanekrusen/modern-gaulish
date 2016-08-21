class CalendarsController < ApplicationController
  def generate
    
  end
  
  def show
    @year = params[:year]
    @month = params[:month]
  end
end
