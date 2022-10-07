class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where(admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user.save(user_params)
    if @user.save
      redirect_to users_path, notice: 'Usuário cadastrado com sucesso'
    else
      flash.now[:notice]  = 'Não foi possível criar usuário'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'Usuário atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar o usuário'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'Usuário removido com sucesso'
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation_password)
  end
end