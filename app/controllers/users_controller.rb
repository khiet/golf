class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def index
    render json: User.select(:id, :email, :role), status: :ok
  end

  def create
    user = User.new(email: params[:email], password: params[:password])

    if user.save
      render json: user.slice(:id, :email), status: :created
    else
      render json: { error: user.errors.full_messages.join(', ') }, status: :bad_request
    end
  end
end
