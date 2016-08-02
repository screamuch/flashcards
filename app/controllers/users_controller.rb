class UsersController < ApplicationController
  skip_before_filter :require_signin

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update!(user_params  )
      redirect_back_or_to user_path(@user)
      flash[:notice] = 'Профиль успешно обновлен'
    else
      redirect_to :action => :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end