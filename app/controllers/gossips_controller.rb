class GossipsController < ApplicationController


  skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: [:create, :show, :new]
  before_action :authenticate_user_edit, only: [:edit, :update]

  def index
    @gossips = Gossip.all
    puts "ok"
    
  end

  def show
    @gossip = Gossip.find(params[:id])
    
  end
  
  def new
    @gossip = Gossip.new
  end
  
  def create
    @city = City.create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: @city)
    #@gossip = Gossip.create(gossip_params)
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
      render :new
    end
  end

  #def create
   # @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 1) # avec xxx qui sont les données obtenues à partir du formulaire

    #if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
     # puts "Tu as réussi "
      #redirect_to gossips_path
    #else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
     # puts "Ça ne fontionne pas"
      #render new_gossip_path
    #end
  
  #end
  

  def edit
    @gossip = Gossip.find(params[:id])          # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end


  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié
    @gossip = Gossip.find(params[:id])
    gossip_user = @gossip.user
    

    if @gossip.update(gossip_params)
      redirect_to gossips_path
      flash[:messages] = "Ton potin a été édité ! "
    else
      render edit_gossip_path
    end

  end


  def destroy
    puts "Methode trouvé"
    @gossip = Gossip.find(params[:id])
    @gossip.destroy if @gossip
    redirect_to gossips_path
    flash[:success] = "Ton potin a été supprimé "
    
  end


  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi !"
      redirect_to new_session_path
    end
  end


end




