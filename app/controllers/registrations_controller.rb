class RegistrationsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      flash = "Bienvenue #{@current_user.name} !"
      redirect_to "/static_page/home"
    else
      flash = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end
end
