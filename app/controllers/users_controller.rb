class UsersController < ApplicationController
  def home
  end

  def login
  end

  def check
    @current_user = User.where(email: params[:email], password: params[:password]).last
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/"
    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
