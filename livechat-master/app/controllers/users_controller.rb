class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(name: params[:user][:name])
    if @user.save
      cookies.signed[:user_id] = @user.id
      redirect_to messages_path
    else
      render :new
    end
  end
end
