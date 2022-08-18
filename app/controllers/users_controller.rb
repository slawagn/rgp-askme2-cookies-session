class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end
  
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    if (user = User.create(user_params))
      log_in_as(user)

      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      redirect_to new_user_path, notice: 'Что-то пошло не так!' 
    end
  end
end
