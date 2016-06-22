class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
    respond_to do |format|
      format.html
      format.json { render :json => @users}
    end
  end

  # GET /users/1
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @user}
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(game_params)
        format.html { redirect_to @user, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      authorize! :assign_roles, @user if params[:user][:role]
      params.require(:user).permit(:username, :email, :role)
    end
end
