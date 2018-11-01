class UsersController < ApplicationController
  def login
  end

  def check
    @current_user = User.where(email: params[:email], password: params[:password]).first
    if @current_user
      flash[:info] = "Bienvenue #{@current_user.name} !"
      redirect_to "/gossips"
    else
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end
end


