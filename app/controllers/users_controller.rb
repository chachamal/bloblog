class UsersController < ApplicationController
  def show
    @posts = current_user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
           redirect_to root_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
          redirect_to user_path(@user)
    else
          render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:introduction,:image)
  end
end
