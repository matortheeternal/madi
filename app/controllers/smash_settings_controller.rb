class SmashSettingsController < ApplicationController
  before_action :set_smash_setting, only: [:show, :edit, :update, :destroy]

  # GET /smash_settings
  def index
    @smash_settings = SmashSetting.all
  end

  # GET /smash_settings/1
  def show
  end

  # GET /smash_settings/new
  def new
    @smash_setting = SmashSetting.new
  end

  # GET /smash_settings/1/edit
  def edit
  end

  # POST /smash_settings
  def create
    @smash_setting = SmashSetting.new(smash_setting_params)

    if @smash_setting.save
      redirect_to @smash_setting, notice: 'Smash setting was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /smash_settings/1
  def update
    if @smash_setting.update(smash_setting_params)
      redirect_to @smash_setting, notice: 'Smash setting was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /smash_settings/1
  def destroy
    @smash_setting.destroy
    redirect_to smash_settings_url, notice: 'Smash setting was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smash_setting
      @smash_setting = SmashSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def smash_setting_params
      params.require(:smash_setting).permit(:submitted_by, :game, :name, :hash, :color, :records, :description, :tree)
    end
end