class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def show
    render json: @user, status: :ok
  end

  def update
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :last_name,
      :gender,
      :description
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
