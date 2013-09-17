class EmployeesController < ApplicationController
  before_filter :signed_in_employee
  #before_filter :correct_employee
  before_filter :admin_employee

  def index
    @employees = Employee.paginate(page: params[:page])
  end

  def show
    @employee = Employee.find(params[:id])
    @driver_licenses = @employee.driver_licenses.paginate(page: params[:page])
  end

  def new
    @employee = Employee.new
    3.times { @employee.driver_licenses.build}
  end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      sign_in @employee
      flash[:success] = "Nuevo Empleado Creado"
      redirect_to @employee
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    1.times { @employee.driver_licenses.build}
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:success] = "Perfil Actualizado"
      sign_in @employee
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.update_attribute(:status,false)
      flash[:success] = "Empleado dado de baja"
      redirect_back_or employees_path
    else
      render 'index'
    end
  end

  #METODOS PRIVADOS
  private
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
    end

end
