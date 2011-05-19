class DependentsController < ApplicationController
  def index
    @dependents = Dependent.all
  end

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
