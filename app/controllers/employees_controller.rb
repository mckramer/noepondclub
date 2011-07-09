class EmployeesController < ApplicationController

  # GET /employees
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @employees }
    end
  end

  # GET /employees/1
  def show
    if Employee.exists?(params[:id])
      @employee = Employee.find(params[:id])
      respond_to do |format|
        format.html
        format.xml  { render :xml => @employee }
      end
    else
      flash[:notice] = "The specified employee does not exist. #{params[:id]}"
      redirect_to :action => 'index'
    end
  end
  
  def profile
    redirect_to :action => 'show', :id => current_employee.id
  end
end
