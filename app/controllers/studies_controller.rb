class StudiesController < ApplicationController
  def create
    @studies = current_employee.studiess.build(params[:studies])
    if @studies.save
      flash[:success] = "Estudio Agregado"
      redirect_to current_employee
    else
      render 'static_pages/home'
    end
  end

  def destroy
    studies=Study.find(params[:id])
    Study.find(params[:id]).destroy
    flash[:success] = "Estudio Eliminado"
    redirect_to employee_path(studies.employee)
  end
end
