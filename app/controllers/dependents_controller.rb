class DependentsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to members_path, :notice => 'No item exists with specified id.'
  end
  
  before_filter :get_member
  before_filter :get_badge_options, :only => [:new, :edit]

  public
  # GET /members/1/dependents
  def index
    @dependents = @member.dependents
    respond_to do |format|
      format.html
      format.xml  { render :xml => @dependent }
    end
  end

  # GET /members/1/dependents/1
  def show
    @dependent = @member.dependents.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @dependent }
    end
  end

  # GET /members/1/dependents/new
  def new
    @dependent = @member.dependents.build
    @dependent.name_last = @member.name.split(" ")[1] unless @member.name.nil?
  end

  # POST /members/1/dependents
  def create
    @dependent = @member.dependents.build(params[:dependent])
    if @dependent.save
      redirect_to [@member, @dependent], :notice => "Successfully created dependent."
    else
      render :action => 'new'
    end
  end

  # GET /members/1/dependents/1/edit
  def edit
    @dependent = @member.dependents.find(params[:id])
  end

  # PUT /members/1/dependents/1
  def update
    @dependent = @member.dependents.find(params[:id])
    if @dependent.update_attributes(params[:dependent])
      redirect_to [@member, @dependent], :notice  => "Successfully updated dependent."
    else
      render :action => 'edit'
    end
  end

  # DELETE /members/1/dependents/1
  def destroy
    @dependent = @member.dependents.find(params[:id])
    @dependent.destroy
    redirect_to member_dependents_url(@member), :notice => "Successfully destroyed dependent."
  end
  
  private
  def get_member
    @member = Member.find(params[:member_id])
  end
  def get_badge_options
    date = Date.today
    @badge_options = Array.new
    @badge_options << [ "Red Frog", date ]
    @badge_options << [ "Blue Frog", date ]
    @badge_options << [ "Green Fish", date ]
    @badge_options << [ "Gold Fish", date ]
    @badge_options << [ "Red Shark", date ]
    @badge_options << [ "Maroon Shark", date ]
  end
end
