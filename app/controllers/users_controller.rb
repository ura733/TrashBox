class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to  @user, notice: "登録しました"
    else
      render :new, notice: "正しい情報を入力してください。"
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
