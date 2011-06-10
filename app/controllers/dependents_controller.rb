class DependentsController < ApplicationController
  before_filter(:get_member)

  private
  def get_member
    @member = Member.find(params[:member_id])
  end
  
  public
  # GET /members/1/dependents
  def index
    @dependents = @member.dependents
  end

  # GET /members/1/dependents/1
  def show
    @dependent = Dependent.find(params[:id])
  end

  def new
    @dependent = Dependent.new
  end

  def create
    @dependent = Dependent.new(params[:dependent])
    if @dependent.save
      redirect_to @dependent, :notice => "Successfully created dependent."
    else
      render :action => 'new'
    end
  end

  def edit
    @dependent = Dependent.find(params[:id])
  end

  def update
    @dependent = Dependent.find(params[:id])
    if @dependent.update_attributes(params[:dependent])
      redirect_to @dependent, :notice  => "Successfully updated dependent."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @dependent = Dependent.find(params[:id])
    @dependent.destroy
    redirect_to dependents_url, :notice => "Successfully destroyed dependent."
  end
end
