class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update]

  load_and_authorize_resource
  check_authorization

  def show
    render json: @user, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :last_name,
      :gender,
      :description,
      :role
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
