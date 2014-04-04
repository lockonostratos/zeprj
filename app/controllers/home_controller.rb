class HomeController < ApplicationController

  def new
  end

  def create
    if (params[:name] == "Cloud")
      redirect_to new_gera_account_path
    else
      redirect_to welcome_path
    end
  end

  def destroy

  end
end
