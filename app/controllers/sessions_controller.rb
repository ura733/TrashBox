class SessionsController < ApplicationController
  #sessions contlloerはログインしていなくても利用できる
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      #認証に成功した場合セッションにuser.idを格納
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new, notice: '正しいログイン情報を入力してください。'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
