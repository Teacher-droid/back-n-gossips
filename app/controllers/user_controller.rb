class UserController < ApplicationController

  def new
    @user = User.new
  end
 

  def show
    @user = User.find(params[:id])
  end

  def create
    @city = City.new
    
    #@user = User.new(users_params)
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age] , password: params[:pass_first], password_confirmation: params[:pass_second])
    
    if @user.save
      puts "Je save l'utilisateur"
      log_in(@user)
      puts "Il est save"
      redirect_to gossips_path 
      flash[:success] = "Ton profil a été crée !"
    else
      puts "Redirige, pas save"
      render new_user_path
      flash[:danger] = "Remplissez tous les champs"
    end
  end

  private 

  def users_params  
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :password_confirmation)
  end

end