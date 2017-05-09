class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    render json: IndexDecorator.new(User, [], self)
  end

  # GET /users/1
  def show
    authorize! :read, @user
    render json: @user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    authorize! :assign_roles, @user if params[:user][:role]
    params.require(:user).permit(:username, :email, :role)
  end

  def filtering_params
    (params[:filters] || {}).slice(:search, :joined, :last_seen)
    # TODO :smash_settings, :smash_reports, :merge_reports
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
