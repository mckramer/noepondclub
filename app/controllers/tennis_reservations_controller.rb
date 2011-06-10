class TennisReservationsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to members_path, :notice => 'No item exists with specified id.'
  end
  
  before_filter(:get_member)

  private
  def get_member
    @member = Member.find(params[:member_id])
  end
  
  public
  # GET /tennis_reservations
  # GET /tennis_reservations.xml
  def index
    @tennis_reservations = @member.tennis_reservations
    @current_reservations = @tennis_reservations.reject {|reservation| reservation.date > Time.now}
    @old_reservations = @tennis_reservations.reject {|reservation| reservation.date < Time.now}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tennis_reservations }
    end
  end

  # GET /tennis_reservations/1
  # GET /tennis_reservations/1.xml
  def show
    @tennis_reservation = TennisReservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tennis_reservation }
    end
  end

  # GET /tennis_reservations/new
  # GET /tennis_reservations/new.xml
  def new
    @tennis_reservation = TennisReservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tennis_reservation }
    end
  end

  # GET /tennis_reservations/1/edit
  def edit
    @tennis_reservation = TennisReservation.find(params[:id])
  end

  # POST /tennis_reservations
  # POST /tennis_reservations.xml
  def create
    @tennis_reservation = TennisReservation.new(params[:tennis_reservation])

    respond_to do |format|
      if @tennis_reservation.save
        format.html { redirect_to(@tennis_reservation, :notice => 'Tennis reservation was successfully created.') }
        format.xml  { render :xml => @tennis_reservation, :status => :created, :location => @tennis_reservation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tennis_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tennis_reservations/1
  # PUT /tennis_reservations/1.xml
  def update
    @tennis_reservation = TennisReservation.find(params[:id])

    respond_to do |format|
      if @tennis_reservation.update_attributes(params[:tennis_reservation])
        format.html { redirect_to(@tennis_reservation, :notice => 'Tennis reservation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tennis_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tennis_reservations/1
  # DELETE /tennis_reservations/1.xml
  def destroy
    @tennis_reservation = TennisReservation.find(params[:id])
    @tennis_reservation.destroy

    respond_to do |format|
      format.html { redirect_to(tennis_reservations_url) }
      format.xml  { head :ok }
    end
  end
end