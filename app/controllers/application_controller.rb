class ApplicationController < ActionController::Base
  #全てのviewでcurrent_userが使えるようにする
  helper_method :current_user
  #前処理
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  #ログインしていなければログイン画面へ
  def login_required
    redirect_to login_path unless current_user
  end
end
