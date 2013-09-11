class EmployeesController < ApplicationController
  before_filter :signed_in_employee, only: [:index, :edit, :update]
  before_filter :correct_employee, only: [:edit, :update]

  def index
    @employee = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
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

  #METODOS PRIVADOS
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Debe ser administrador" 
      end
    end

    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_employee?(@employee)
    end
end
