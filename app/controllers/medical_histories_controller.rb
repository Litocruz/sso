class MedicalHistoriesController < ApplicationController
	def create
    @medical_history = current_employee.build_medical_history(params[:medical_history])
    if @medical_history.save
      flash[:success] = "Historial Medico Creado"
      redirect_to current_employee
    else
      render 'static_pages/home'
    end
  end

  def destroy
    medical_history=MedicalHistory.find(params[:id])
    MedicalHistory.find(params[:id]).destroy
    flash[:success] = "Historial Medico Eliminado"
    redirect_to employee_path(medical_history.employee)
  end
end
