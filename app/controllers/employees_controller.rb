class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
    else
      render 'new'
    end
  end
end
