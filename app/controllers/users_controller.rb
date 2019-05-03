class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  #def create
 # end
  
 def create 
   user = User.find_by(email: params[:session][:email].downcase)
   if user  && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     flash[:success] = "You have logged in"
     redirect_to users_path(user)
   else
     flash.now[:danger] = "There was something wrong with your login information"
     render 'new'
  end
 end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
 def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
 end
end