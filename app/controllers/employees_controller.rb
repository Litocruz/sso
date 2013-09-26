class EmployeesController < ApplicationController
  before_filter :signed_in_user
  #before_filter :correct_employee
 # before_filter :admin_user

  def index
    #@employees = Employee.paginate(page: params[:page])
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.json { render json: EmployeesDatatable.new(view_context) }
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @driver_licenses = @employee.driver_licenses.paginate(page: params[:page])
  end

  def new
    @employee = Employee.new
    1.times { @employee.driver_licenses.build}
  end

  def create
    @employee = Employee.new(params[:employee])
    respond_to do |format|
      if @employee.save
        format.html { redirect_to(employees_path, notice: "Empleado creado correctamente.."  )}
        format.js { flash[:success]="Empleado creado correctamente." }
        format.json { render json: @employee, status: :created, notice: "Empleado Creado", location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, notice: "podrido", status: :unprocessable_entity }
      end
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
      #sign_in @employee
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
      redirect_to(root_path) unless current_user?(@employee)
    end

end
