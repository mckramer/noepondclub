class PageController < ApplicationController
  before_filter :authenticate_member!, :only => [:current, :teams_swimming]
  def home
    @post = Post.first
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
  
  def current
    @posts = Post.all(:order => "id DESC")
  end
  
  def teams_swimming
    @posts = Post.where(:category => 'swim-team')
    # @events = Event.where(:category => 'swim-team')
  end
  
end
