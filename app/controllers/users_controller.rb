class UsersController < ApplicationController
  #before_filter :signed_in_user
  before_filter :admin_user, only: [:show, :index]

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #sign_in @employee
      flash[:success] = "Nuevo Administrador Creado"
      redirect_to signin_path
    else
      render 'new'
    end
  end
end
