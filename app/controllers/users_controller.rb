class UsersController < ApplicationController
  def new
  end

  def create
    if @user.find_by({"email" => params["email"]}) == nil
      @user = User.new
      @user["first_name"] = params["first_name"]
      @user["last_name"] = params["last_name"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/places"
    else
      flash["notice"] = "Email taken."
      redirect_to "/users/new"
    end
  end
end
