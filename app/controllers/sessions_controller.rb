class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.authenticate(params[:name], params[:password])
    if account
      redirect_to signin_path, :notice => 'Chao mung tro lai'
    else
      flash.now.alert = 'Dang nhap that bai'
      render "new"
    end
  end

  def destroy

  end
end
