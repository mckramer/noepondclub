class IndependentsController < ApplicationController
  # GET /independents
  # GET /independents.xml
  def index
    @independents = Independent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @independents }
    end
  end

  # GET /independents/1
  # GET /independents/1.xml
  def show
    @independent = Independent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @independent }
    end
  end

  # GET /independents/new
  # GET /independents/new.xml
  def new
    @independent = Independent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @independent }
    end
  end

  # GET /independents/1/edit
  def edit
    @independent = Independent.find(params[:id])
  end

  # POST /independents
  # POST /independents.xml
  def create
    @independent = Independent.new(params[:independent])

    respond_to do |format|
      if @independent.save
        format.html { redirect_to(@independent, :notice => 'Independent was successfully created.') }
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
    @independent = Independent.find(params[:id])

    respond_to do |format|
      if @independent.update_attributes(params[:independent])
        format.html { redirect_to(@independent, :notice => 'Independent was successfully updated.') }
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
    @independent = Independent.find(params[:id])
    @independent.destroy

    respond_to do |format|
      format.html { redirect_to(independents_url) }
      format.xml  { head :ok }
    end
  end
end
