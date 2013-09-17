class DriverLicensesController < ApplicationController
  before_filter :signed_in_employee
  before_filter :admin_employee

  def create
    @driver_license = current_employee.driver_licenses.build(params[:driver_license])
    if @driver_license.save
      flash[:success] = "Licencia de Conducir Creada"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    DriverLicense.find(params[:id]).destroy
    flash[:success] = "Licencia de Conducir Eliminada"
    redirect_back_or employees_path()
  end
end
