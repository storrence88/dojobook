# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    current_user.friend_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def create
    current_user.accept_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.reject_request(@user)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
