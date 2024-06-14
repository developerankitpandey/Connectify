class ProfileController < ApplicationController
  
  def index
    @posts = current_user.posts
  end

  def show 
    @profile = current_user.profile.find_by(id: params[:id])
  end 
  
  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params 
    params.require(:profile).permit(:first_name, :bio, :location, :birthday, :gender)
  end 
end 
