class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show]

  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      respond_to do |format|
        format.html { redirect_to profile_path(@profile), notice: 'Profile was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      respond_to do |format|
        format.html { redirect_to profile_path(@profile), notice: 'Profile was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :bio, :location, :birthday, :gender)
  end
end
