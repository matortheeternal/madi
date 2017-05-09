class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:invitation_token, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:invite) { |u| u.permit(:invitation_token, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def create_record(klass, params)
    record = klass.new(params)
    authorize! :create, record
    if record.save
      render json: {status: :ok}
    else
      render json: record.errors, status: :unprocessable_entity
    end
  end

  def update_record(record, params)
    authorize! :update, record
    if record.update(params)
      render json: {status: :ok}
    else
      render json: record.errors, status: :unprocessable_entity
    end
  end

  def destroy_record(record)
    authorize! :destroy, record
    if record.destroy
      render json: {status: :ok}
    else
      render json: record.errors, status: :unprocessable_entity
    end
  end
end
