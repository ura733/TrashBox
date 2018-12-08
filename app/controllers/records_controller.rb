class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = current_user.records.find(params[:id])
  end

  def edit
    @record = current_user.records.find(params[:id])
  end

  def update
    record = current_user.records.find(params[:id])
    record.update!(record_params)
    redirect_to records_url, notice: "「#{record.name}」を更新しました。"
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.new(record_params)
    # record = Record.new(record_params)
    if @record.save
      redirect_to records_url, notice: "「#{@record.name}を登録しました。」"
    else
      render :new
    end
  end

  def destroy
    record = current_user.records.find(params[:id])
    record.destroy
    redirect_to records_url, notice: "「#{record.name}を削除しました。」"
  end

  private
  def record_params
    #nameとdescription情報のみ受け取る
    params.require(:record).permit(:name, :week)
  end
end
