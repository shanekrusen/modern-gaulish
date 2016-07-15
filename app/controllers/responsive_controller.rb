class ResponsiveController < ApplicationController
  
  def optOut
    cookies[:responsive] = "no"
    redirect_to root_path
  end

  def optIn
    cookies.delete(:responsive)
    redirect_to root_path
  end
 
end
