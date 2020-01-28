# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :admin]

  def new
  end

  def login
  end

  def admin
  end

  def logout
    reset_session
    redirect_to "/login"
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/admin"
    else
      redirect_to "/login"
    end
  end
end
