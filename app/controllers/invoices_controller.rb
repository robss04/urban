class InvoicesController < ApplicationController

  respond_to :json

  def index
    @user = User.find(params[:user_id])
    @invoices = params[:id] ? @user.invoices.includes(:selections => [:item]).find(params[:id].split(","))  : @user.invoices.includes(:selections => [:item])
  end

  def create
  end

  def update
  end

  def destroy 
    head @invoice.destroy ? :no_content : :unprocessable_entity
  end

end