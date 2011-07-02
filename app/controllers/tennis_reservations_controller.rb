class TennisReservationsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to members_path, :notice => 'No item exists with specified id.'
  end
  
  before_filter(:get_member)

  public
  # GET /members/1/reservations/tennis
  def index
    @tennis_reservations = @member.tennis_reservations
    @tennis_reservations.sort! { |a, b| [a.date, a.start_at, a.court] <=> [b.date, b.start_at, b.court] }
    today = Date.today
    @current_reservations = @tennis_reservations.reject {|reservation| reservation.date < today}
    @old_reservations = @tennis_reservations.reject {|reservation| reservation.date >= today}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tennis_reservations }
    end
  end

  # GET /members/1/reservations/tennis/1
  def show
    @tennis_reservation = @member.tennis_reservations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tennis_reservation }
    end
  end

  # GET /members/1/reservations/tennis/new
  def new
    @tennis_reservation = @member.tennis_reservations.build
    @times = Array.new
    time = 480
    11.times do
      time = time + 60
      @times << [ "#{time_formatted(time)}", time ]
    end
    @days = Array.new
    day = Date.today - 1.day
    7.times do
      day = day + 1.day
      @days << [ "#{Date::MONTHNAMES[day.month]} #{day.day}", day ]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tennis_reservation }
    end
  end

  # GET /members/1/reservations/tennis/1/edit
  def edit
    @tennis_reservation = @member.tennis_reservations.find(params[:id])
  end

  # POST /members/1/reservations/tennis
  def create
    @tennis_reservation = @member.tennis_reservations.build(params[:tennis_reservation])
    @tennis_reservation.end_at = @tennis_reservation.start_at.to_i + @tennis_reservation.length.to_i

    respond_to do |format|
      if @tennis_reservation.save
        format.html { redirect_to(member_tennis_reservations_url(@member), :notice => 'Tennis reservation was successfully created.') }
        format.xml  { render :xml => @tennis_reservation, :status => :created, :location => @tennis_reservation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tennis_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1/reservations/tennis/1
  def update
    @tennis_reservation = @member.tennis_reservations.find(params[:id])
    params[:tennis_reservation][:end_at] = params[:tennis_reservation][:start_at].to_i + params[:tennis_reservation][:length].to_i

    respond_to do |format|
      if @tennis_reservation.update_attributes(params[:tennis_reservation])
        format.html { redirect_to([@member, @tennis_reservation], :notice => 'Tennis reservation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tennis_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1/reservations/tennis/1
  def destroy
    @tennis_reservation = @member.tennis_reservations.find(params[:id])
    @tennis_reservation.destroy

    respond_to do |format|
      format.html { redirect_to(member_tennis_reservations_url(@member)) }
      format.xml  { head :ok }
    end
  end
  
  private
  def get_member
    @member = Member.find(params[:member_id])
  end
  def time_formatted(time)
    hours = time / 60
    minutes = time - (hours * 60)
    if hours < 12
      return "#{hours}:#{0 if minutes < 10}#{minutes} am"
    elsif hours == 12
      return "12:00 pm"
    else
      return "#{hours-12}:#{0 if minutes < 10}#{minutes} pm"
    end
  end
  
end