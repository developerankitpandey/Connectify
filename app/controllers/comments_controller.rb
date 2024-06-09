class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
      if @comment.save 
        @comment.user = current_user
        redirect_to @post, notice: "Comment added successfully"
      else 
        redirect_to @post, notice: "Enter valid comment"
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

  private 

  def comment_params 
    params.require(:comment).permit(:body, :parent_id)
  end
  
  def set_post 
    @post = Post.find_by(id: params[:post_id]) 
  end
end
