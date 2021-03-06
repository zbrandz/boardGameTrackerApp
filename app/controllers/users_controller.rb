class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
    @games = @user.games
    @created_game = @user.created_games
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private   
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end