class LikesController < ApplicationController
  before_action :set_post, only: [ :create, :destroy ]
  
  def create 
    @like = @post.likes.new(user: current_user)
      if @like.save 
        respond_to do |format|
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.turbo_stream
        end
      else
        render :new
      end
  end 

  def destroy 
    @like = @post.likes.find_by(user: current_user) 
      if @like.destroy
        redirect_to @post, notice: "Post unliked!"
      else  
        redirect_to @post, alert: "Unable to unlike post"
      end 
  end 

  private 

  def set_post 
    @post = Post.find_by(id: params[:post_id])
  end 
end