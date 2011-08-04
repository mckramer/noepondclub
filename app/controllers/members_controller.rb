class MembersController < ApplicationController

  # GET /members
  # GET /members.xml
  def index
    @members = Member.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @users }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    if Member.exists?(params[:id])
      @member = Member.find(params[:id])
      @tennis_reservations = @member.tennis_reservations.reject {|reservation| reservation.date < Date.today}
      respond_to do |format|
        format.html
        format.xml  { render :xml => @user }
      end
    else
      flash[:notice] = "The specified member does not exist"
      redirect_to :action => 'index'
    end
=begin
    id = params[:id]
    if id.to_i == 0
      ids = id.split('-')
      if Member.exists?(:id => ids[1])
        @member = Member.find(ids[1])
        @tennis_reservations = @member.tennis_reservations.reject {|reservation| reservation.date < Date.today}
        respond_to do |format|
          format.html
          format.xml  { render :xml => @user }
        end
      else
        flash[:notice] = "The specified member does not exist"
        redirect_to :action => 'index'
      end
    else
      if Member.exists?(:badge => id)
        @member = Member.find_by_badge(id)
        @tennis_reservations = @member.tennis_reservations.reject {|reservation| reservation.date < Date.today}
        respond_to do |format|
          format.html
          format.xml  { render :xml => @user }
        end
      else
        flash[:notice] = "The specified member does not exist"
        redirect_to :action => 'index'
      end
    end
=end    
  end
  
end
