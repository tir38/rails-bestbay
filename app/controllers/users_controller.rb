class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :show]
  before_filter :correct_user, only: [:edit, :update, :show]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

   def create
     @user = User.new(params[:user])
     if @user.save
       UserMailer.registration_confirmation(@user).deliver
       #once new user register, send an confirmation email to the user's email.
       sign_in @user
       flash[:success] = "Welcome to BestBay!"
       redirect_to @user
     else
       render 'new'
     end
   end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
