class SmashSettingsController < ApplicationController
  before_action :set_smash_setting, only: [:show, :update, :destroy]

  # GET /smash_settings/index
  def index
    render json: IndexDecorator.new(SmashSetting, [:user], self)
  end

  # GET /smash_settings/1
  def show
    render json: @smash_setting
  end

  # POST /smash_settings
  def create
    create_record(SmashSetting, smash_setting_params)
  end

  # PATCH/PUT /smash_settings/1
  def update
    update_record(@smash_setting, smash_setting_params)
  end

  # DELETE /smash_settings/1
  def destroy
    destroy_record(@smash_setting)
  end

  # Only allow a trusted parameter "white list" through.
  def smash_setting_params
    params.require(:smash_setting).permit(:submitted_by, :approved, :game, :name, :hash, :color, :records, :description, :tree)
  end

  def filtering_params
    (params[:filters] || {}).slice(:approved, :game, :search, :records, :created, :updated)
  end

  private
    def set_smash_setting
      @smash_setting = SmashSetting.find(params[:id])
    end
end
