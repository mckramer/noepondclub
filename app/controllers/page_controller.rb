class PageController < ApplicationController
  def home
  
  end
  
  def about
  
  end
  
  def contact
  
  end
  
  def directions
  @directions = nil
  case params[:from]
    when "chatham"
      @directions = "DirectionsChaham.pdf"
    when "chathamborough"
      @directions = "DirectionsChahamBorough.pdf"
    when "madison"
      @directions = "DirectionsMadison.pdf"
    when "summit"
      @directions = "DirectionsSummit.pdf"
    end
  end
  
  def employment
  
  end
  
  def current
  
  end
  
  def prospective
  
  end
  
  def family
  
  end
  
  def history
  
  end
  
end
