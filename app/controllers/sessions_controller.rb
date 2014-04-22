class SessionsController < ApplicationController
  skip_before_filter :check_account_permission, :only => [:new, :create]

  def new
  end

  def create
    account = Account.find_by_email(params[:email])
    if account && account.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = account.auth_token
      else
        cookies[:auth_token] = account.auth_token
      end

      redirect_to welcome_path, :notice => 'Chao mung tro lai'
    else
      flash.now.alert = 'Dang nhap that bai'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to signin_path, :notice => 'Dang xuat thanh cong'
  end
end
