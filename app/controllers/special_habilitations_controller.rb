class SpecialHabilitationsController < ApplicationController

def create
    @special_habilitation = current_employee.special_habilitations.build(params[:special_habilitation])
    if @special_habilitation.save
      flash[:success] = "Habilitacion Especial Creada"
      redirect_to current_employee
    else
      render 'static_pages/home'
    end
end

 def destroy
    special_habilitation=SpecialHabilitation.find(params[:id])
    SpecialHabilitation.find(params[:id]).destroy
    flash[:success] = "Habilitacion Especial Eliminada"
    redirect_to employee_path(special_habilitation.employee)
  end
end
