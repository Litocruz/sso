class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by_document_number(params[:session][:document_number])
    if employee && employee.authenticate(params[:session][:password])
      sign_in employee
      redirect_back_or employee
    else
      #flash.now hace que el mensaje no persista en subsecuentes paginas listing 8.12
      flash.now[:error] = 'Combinacion de numero de documento y password erroneo'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
