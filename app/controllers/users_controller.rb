class UsersController < ApplicationController
  


  def new
    @user = User.new
  end

    def create
      @user = User.new(user_params)
 
      if @user.save
          session[:user_id] = @user.id
          redirect_to new_article_path
      else
          render 'new'
      end
  end

  def signin
    @user = User.new

  end

  def login
    user = User.find_by(email: params['email'].downcase)
    if user && user.authenticate(params['password'])
      session[:user_id] = user.id 
      redirect_to root_path 
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render 'signin'
    end
  end

  def log_out
    session[:user_id]=nil
    session.destroy
    redirect_to root_path
  end


  
  private
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

  
 
end
