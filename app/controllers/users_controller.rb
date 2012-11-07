class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

   def create
     @user = User.new(params[:user])
     if @user.save
       sign_in @user
       flash[:success] = "Welcome to BestBay!"
       redirect_to @user
     else
       render 'new'
     end
   end

  def destroy

  end

end