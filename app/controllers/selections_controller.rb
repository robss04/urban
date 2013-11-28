class SelectionsController < ApplicationController

  respond_to :json

  def index
    @invoice = Invoice.find(params[:invoice_id])
    @selections = params[:id] ? @invoice.selections.find(params[:id].split(","))  : @invoice.selections
  end

  def create
  end

  def update
  end

  def destroy 
    head @selection.destroy ? :no_content : :unprocessable_entity
  end

end