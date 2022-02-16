class CommentsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user, only: [:create]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:id])
  end


  def create
    
    @comment = Comment.new(content: params[:content], user_id: current_user.id, gossip_id: params[:id])
    #@user = User.find(params[:id])
    
    @comment.gossip_id = params[:gossip_id]
    if @comment.save
      redirect_to gossips_path
      flash[:success] = "Ton commentaire a été ajouté !"
    else
      render 'new'
    end
  end
  
  # POST /comments or /comments.json
  #def create
   # @gossip = Gossip.find(params[:gossip_id])
    #@comment = @gossip.comments.new(comment_params)
    #puts @comment.content
  
    #respond_to do |format|
     # if @comment.save
      #  format.html { redirect_to gossip_path, notice: 'Comment was successfully created.' } # changed the redirect to @post
      #end
    #end
  #end

  


  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to gossip_path(@comment.gossip)
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to gossips_path(@comment.gossip)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :gossip_id, :content)
    end

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end



end




