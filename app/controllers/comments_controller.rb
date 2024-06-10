class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
      if @comment.save 
        redirect_to @post, notice: "Comment added successfully"
      else 
        redirect_to @post, notice: "Enter valid comment"
      end
  end

  def edit 
    @comment = @post.comments.find_by(id: params[:id])
  end 

  def update 
    @comment = @post.comments.find_by(id: params[:id])
    if @comment.save(comment_params)
      redirect_to @post, notice: "Comment updated successfully"
    else  
      render :edit, status: :unprocessable_entity
    end 
  end 
  
  def destroy
    @comment = @post.comments.find_by(id: params[:id])
      if @comment.present? 
         @comment.destroy 
         redirect_to @post, notice: "Comment deleted successfully"
      else 
         redirect_to @post, notice: "Comment not found"
      end
  end

  def comments 
    @comments = @posts.comments.where(parent_id: nil).order(created_at: :desc)
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:body, :parent_id)
  end
  
  def set_post 
    @post = Post.find_by(id: params[:post_id]) 
  end
end
