class UsersController < ApplicationController
  before_action :current_user
  def new
    @user = User.new
  end

    def create
      @user = User.new(user_params)
 
      if @user.save
          session[:user_id] = @user.id
          redirect_to new_article_path
      else
        flash[:reg_form_messages] = @user.errors
        redirect_to user_register_path
     
      end
  end

  def signin
    @user = User.new

  end

  def login
    @user = User.find_by(email: params['email'].downcase)
    if @user && @user.authenticate(params['password'])
      session[:user_id] = @user.id 
      redirect_to root_path 
    else
      flash[:alert] = 'Invalid email/password combination'
      redirect_to signin_user_path
    end
  end

  def log_out
    session[:user_id]=nil
    @current_user = nil
    session.destroy
    redirect_to root_path
  end

  def editprofile
    @user = User.find_by(id: @current_user.id)
  end

  def save_editied_profile
    
  #  redirect_to root_path, notice: @current_user.id
  #  redirect_to root_path, notice: update_status if  update_status.update(username: params['username'], email: params['email'])
    if invalid_current_password
      flash[:alert]= "your current password isn't equal to old password"
    elsif  @current_user.update(update_user_params)
        flash[:notice] = "Your page is succesfuly updated"
    else
      flash[:reg_form_messages] = @current_user.errors
    end
    redirect_to edit_profile_path
  end

  

  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.permit(:password, :password_confirmation)
  end
 
  def invalid_current_password
    !@current_user.authenticate(params['current_password'])
  end
end
