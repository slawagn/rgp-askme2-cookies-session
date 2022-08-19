class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    if (user = User.create(user_params))
      log_in_as(user)

      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Что-то пошло не так!' 
      
      render :new
    end
  end
end
