class UsersController < ApplicationController

  respond_to :json

  def index

    @users = params[:id] ? User.where('id in (?)', params[:id].split(","))  : User.all
  end

  def create
    head User.new(user_params).save ? :created : :unprocessable_entity
  end

  def update
    head @user.update(user_params) ? :reset_content : :unprocessable_entity
  end

  def destroy 
    head @user.destroy ? :no_content : :unprocessable_entity
  end

  private
    
    def get_user
      head :not_found unless @user = User.where('id = ?', params[:id]).take
    end
    
    def user_params
      params.require( :user ).permit( :name )
    end

end
