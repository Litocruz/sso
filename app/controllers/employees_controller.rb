class EmployeesController < ApplicationController
  before_filter :signed_in_user
  #before_filter :correct_employee
  # before_filter :admin_user
  helper_method :sort_column, :sort_direction

  def index
    @ajax_search = params[:ajax_search] == "true" ? true : false

    @employees = Employee.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 15)
    #@employees = Employee.all
    respond_to do |format|
      format.html # index.html.erb
      format.js   # index.js.erb
      format.json { render json: @employees }
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @driver_licenses = @employee.driver_licenses.paginate(page: params[:page])
    @studies = @employee.studies.paginate(page: params[:page])
  end


  def new
    @employee = Employee.new
    1.times { @employee.driver_licenses.build}
    1.times { @employee.studies.build}
    require 'csv'
     csv_text = File.read("././lib/driver_license.csv")
     csv = CSV.parse(csv_text, :headers => true)
     csv.each do |row|
     puts
     "Categoria: #{row['cat']} -
     Descripcion: #{row['descripcion']} -"
     end
  end

  def create
    @employee = Employee.new(params[:employee])
    #respond_to do |format|
      if @employee.save
        flash[:success] = "Perfil Actualizado"
        redirect_to @employee
=begin    
        format.html { redirect_to employees_path, flash[:success] = "Empleado creado correctamente.."  }
        format.js { flash[:success]="Empleado creado correctamente." }
        format.json { render json: @employee, status: :created, location: @employee }
=end
      else
        render 'new'
=begin
        format.html { render action: "new" }
        format.js { render js:  flash[:error]=@employee.errors.full_messages  }
        format.json { render json: {errors: @employee.errors.full_messages}, status: :unprocessable_entity }
=end
      end
   # end
  end

  def edit
    @employee = Employee.find(params[:id])
    1.times { @employee.driver_licenses.build}
    1.times { @employee.studies.build}
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
      #redirect_back_or employees_path
      @employees = Employee.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 15)
      #redirect_to employees_path
=begin
      respond_to do |format|
        format.html { redirect_to employees_path }
        format.js 
        format.json
      end

    
   else
      flash[:error]="No se pudo dar de baja el empleado"
      respond_to do |format|
        #render 'index'
        format.html { render action: "index" }
        format.js 
        format.json 
      end
=end
    end
    #redirect_back_or employees_path
  end

  #METODOS PRIVADOS
  private
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_user?(@employee)
    end

    # sort icin default column
    def sort_column
      # column varmi diye kontrol ediliyor, yoksa name default   
      Employee.column_names.include?(params[:sort]) ? params[:sort] : "name"   
    end  
   
    # sort icin default direction asc
    def sort_direction
      # karakter kontrol yapiliyor security icin  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
    end  

end
