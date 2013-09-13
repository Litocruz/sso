class DriverLicensesController < ApplicationController
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
  end
end
