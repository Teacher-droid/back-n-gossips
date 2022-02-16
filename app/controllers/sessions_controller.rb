class SessionsController < ApplicationController

  include SessionsHelper
  
  
def new
  puts "nouvelle session"
end

def create

  puts "Création de la session utilisateur"
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])

  puts "J'ai trouvé l'utilisateur"
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:password])
    
    log_in(user)
    # redirige où tu veux, avec un flash ou pas
    redirect_to gossips_path
  else
    render 'new'
    flash[:danger] = "Email/Mot de passe érroné"
  end


end

  
  def destroy
    puts "Déconnexion"
    session.delete(:user_id)
    puts "Déconnexion"
    redirect_to gossips_path
  end
end
