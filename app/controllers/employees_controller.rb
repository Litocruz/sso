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
    @special_habilitations = @employee.special_habilitations.paginate(page: params[:page])
    @studies = @employee.studies.paginate(page: params[:page])
    if @employee.country_id != nil
      @country = Country.find(@employee.country_id)
    else
      @country = nil 
    end
  end


  def new
    @employee = Employee.new
    @countries = Country.all
    1.times { @employee.driver_licenses.build}
    1.times { @employee.studies.build}
    1.times { @employee.special_habilitations.build}
    j = ActiveSupport::JSON
    @contents = File.read("#{Rails.root}/app/assets/javascripts/driver_license.json")
    @encoded = j.decode(@contents)
    e = ActiveSupport::JSON
    @econtents = File.read("#{Rails.root}/app/assets/javascripts/special.json")
    @special = e.decode(@econtents)
  end

  def create
    @employee = Employee.new(params[:employee])
    #respond_to do |format|
    if @employee.save 
      flash[:success] = "Perfil Actualizado"
      redirect_to @employee
    else
      render 'new'
    end
   # end
  end

  def edit
    @employee = Employee.find(params[:id])
    @countries = Country.all
    j = ActiveSupport::JSON
    @contents = File.read("#{Rails.root}/app/assets/javascripts/driver_license.json")
    @encoded = j.decode(@contents)
    e = ActiveSupport::JSON
    @econtents = File.read("#{Rails.root}/app/assets/javascripts/special.json")
    @special = e.decode(@econtents)
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
      @employees = Employee.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 15)
      respond_to do |format|
        format.html { redirect_to employees_path}
        format.js 
        format.json { head :ok }
      end
      #render @employees

      
    end
    #redirect_back_or employees_path
  end

  #METODOS PRIVADOS
  private
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_user?(@employee)
    end

    def sort_column
      Employee.column_names.include?(params[:sort]) ? params[:sort] : "name"   
    end  
   
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"    
    end  

end
