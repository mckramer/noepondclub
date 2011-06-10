class PageController < ApplicationController
  def home
    @post = Post.last
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
    @posts = Post.all(:order => "id DESC")
  end
  
  def prospective
  
  end
  
  def family
  
  end
  
  def history
  
  end
  
end
