class CommentsController < ApplicationController
  before_action :load_commentable
  #authenticate current_user before performing actions
  before_action :authenticate_user!, except:[:index, :show]
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment].permit(:content))
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    if @comment.destroy
    	redirect_to @commentable, notice: "Deleted comment"
    else
    	redirect_to @commentable, notice: "Unable to delete comment!"
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
