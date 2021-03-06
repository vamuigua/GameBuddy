class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy,:upvote,:downvote]
  #authenticate current_user before performing actions
  before_action :authenticate_user!, except:[:index, :show]

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @forum = Forum.find(params[:id])
    @commentable = @forum
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /forums/new
  def new
    @forum = current_user.forums.build
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = current_user.forums.build(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #upvote method
  def upvote
    #assign upvote to current user
    @forum.upvote_by current_user
    #back redirects the current user to the page they where currently on
    redirect_back(fallback_location: root_path)
  end

  #downvote method/action
  def downvote
    #assign downvote to current user
    @forum.downvote_by current_user
    #back redirects the current user to the page they where currently on
    redirect_back(fallback_location: root_path)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_forum
    @forum = Forum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def forum_params
    params.require(:forum).permit(:title, :question, :user_id)
  end
end
