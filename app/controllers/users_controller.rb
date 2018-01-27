class UsersController < ApplicationController
  # before_action :authenticate_user

  def index
    render json: User.select(:id, :email), status: :ok
  end
end
