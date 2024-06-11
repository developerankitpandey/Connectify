class LikesController < ApplicationController
  before_action :set_post, only: [ :create, :destroy ]
  
  def create 
    @like = @post.likes.new(user: current_user)
      if @like.save 
         redirect_to @post, notice: "Post liked!"
      else 
         redirect_to @post, alert: "Sign-up first. Unable to like"
      end 
  end 

  def destroy 
    @like = @post.likes.find_by(user: current_user) 
      if @like.present? 
        @like.destroy 
        redirect_to @post, notice: "Post unliked!"
      else  
        redirect_to @post, alert: "Unable to unlike post"
      end 
  end 

  private 

  def set_post 
    @post = Post.find_by(params[:post_id])
  end 
end
