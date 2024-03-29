# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :is_admin?
  helper_method :is_student?
  helper_method :bulletin_user?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def is_admin?
    current_user.username == "admin"
  end

  def is_student?
    current_user.username == "student"
  end

  def bulletin_user?
    current_user.username == "bulletin"
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to "/admin" unless logged_in?
  end
end
