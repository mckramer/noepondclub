class IndependentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to members_path, :notice => 'No item exists with specified id.'
  end

  before_filter :get_member
  
  public
  
  # GET /members/1/independents
  # GET /members/1/independents.xml
  def index
    @independents = @member.independents

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @independents }
    end
  end

  # GET /members/1/independents/1
  # GET /members/1/independents/1.xml
  def show
    @independent = @member.independents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @independent }
    end
  end

  # GET /members/1/independents/new
  # GET /members/1/independents/new.xml
  def new
    @independent = @member.independents.build
    @independent.name_last = @member.name.split(" ")[1] unless @member.name.nil?

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @independent }
    end
  end

  # GET /members/1/independents/1/edit
  def edit
    @independent = @member.independents.find(params[:id])
    unless @independent.phone.blank?
      phone = @independent.phone.split("-")
      @independent.phone_areacode = phone[0]
      @independent.phone_exchange = phone[1]
      @independent.phone_subscriber = phone[2]
    end
  end

  # POST /members/1/independents
  # POST /members/1/independents.xml
  def create
    @independent = @member.independents.build(params[:independent])
    @independent.phone = params[:independent][:phone_areacode] + "-" +  params[:independent][:phone_exchange] + "-" + params[:independent][:phone_subscriber]

    respond_to do |format|
      if @independent.save
        format.html { redirect_to(@member, :notice => 'Independent was successfully created.') }
        format.xml  { render :xml => @independent, :status => :created, :location => @independent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @independent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /independents/1
  # PUT /independents/1.xml
  def update
    @independent = @member.independents.find(params[:id])
    params[:independent][:phone] = params[:independent][:phone_areacode] + "-" +  params[:independent][:phone_exchange] + "-" + params[:independent][:phone_subscriber]

    respond_to do |format|
      if @independent.update_attributes(params[:independent])
        format.html { redirect_to(@member, :notice => 'Independent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @independent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /independents/1
  # DELETE /independents/1.xml
  def destroy
    @independent = @member.independents.find(params[:id])
    @independent.destroy

    respond_to do |format|
      format.html { redirect_to(member_independents_url(@member)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_member
    @member = Member.find(params[:member_id])
  end
  
end
